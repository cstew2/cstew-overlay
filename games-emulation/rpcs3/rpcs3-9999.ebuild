# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic xdg git-r3

ASMJIT_COMMIT="416f7356967c1f66784dc1580fe157f9406d8bff"
GLSLANG_COMMIT="36d08c0d940cf307a23928299ef52c7970d8cee6"
MINIUPNP_COMMIT="f22a96b4697699d32fdc2d17c5d0ad7880a99c24"
RTMIDI_COMMIT="1e5b49925aa60065db52de44c366d446a902547b"
WOLFSSL_COMMIT="8970ff4c34034dbb3594943d11f8c9d4c5512bd5"
SOUNDTOUCH_COMMIT="ced3ce8d5ecc5aef8a5156fea206a37b33774bf3"
YAMLCPP_COMMIT="456c68f452da09d8ca84b375faa2b1397713eaba"

DESCRIPTION="PS3 emulator/debugger"
HOMEPAGE="https://rpcs3.net/"
EGIT_REPO_URI="https://github.com/RPCS3/rpcs3"
EGIT_SUBMODULES=( 'asmjit'
				  '3rdparty/glslang'
				  '3rdparty/miniupnp/miniupnp'
				  '3rdparty/rtmidi/rtmidi'
				  '3rdparty/SoundTouch/soundtouch'
				  '3rdparty/wolfssl'
				  '3rdparty/zstd/zstd'
				  '3rdparty/stblib/stb'
				  '3rdparty/OpenAL/openal-soft'
				  '3rdparty/fusion/fusion'
				  '3rdparty/yaml-cpp'
				)
KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"
IUSE="faudio +llvm opencv vulkan wayland"

DEPEND="
	app-arch/p7zip
	dev-libs/flatbuffers
	dev-libs/hidapi
	dev-libs/libevdev
	=dev-libs/pugixml-9999
	dev-libs/xxhash
	dev-qt/qtbase:6[concurrent,dbus,gui,widgets]
	dev-qt/qtmultimedia:6
	dev-qt/qtsvg:6
	media-libs/alsa-lib
	media-libs/cubeb
	media-libs/glew
	media-libs/libglvnd
	media-libs/libpng:=
	media-libs/openal
	media-libs/libsdl3
	media-video/ffmpeg:=
	net-misc/curl
	llvm-core/llvm:=
	sys-libs/zlib
	virtual/libusb:1
	x11-libs/libX11
	faudio? ( app-emulation/faudio )
	opencv? ( media-libs/opencv )
	vulkan? ( media-libs/vulkan-loader[wayland?] )
	wayland? ( dev-libs/wayland )
"
RDEPEND="${DEPEND}"

QA_PREBUILT="usr/share/rpcs3/test/.*"
QA_WX_LOAD="usr/share/rpcs3/test/*"

src_prepare() {
	# Disable automagic ccache
	sed -i -e '/find_program(CCACHE_FOUND ccache)/d' CMakeLists.txt || die

	# Unbundle hidapi
	sed -i -e '/hidapi\.h/{s:":<hidapi/:;s/"/>/}' rpcs3/Input/hid_pad_handler.h || die
	sed -i -e '/hidapi/d' 3rdparty/CMakeLists.txt || die
	sed -i -e '1afind_package(PkgConfig REQUIRED)\npkg_check_modules(hidapi-hidraw REQUIRED hidapi-hidraw)' \
		rpcs3/CMakeLists.txt || die
	sed -i -e 's/3rdparty::hidapi/hidapi-hidraw/' rpcs3/CMakeLists.txt rpcs3/rpcs3qt/CMakeLists.txt || die
	sed -i -e 's/hid_write_control/hid_write/' \
		rpcs3/Input/dualsense_pad_handler.cpp rpcs3/Input/ds4_pad_handler.cpp || die

	# Unbundle cubeb
	sed -i -e '/cubeb/d' 3rdparty/CMakeLists.txt || die
	sed -i -e '$afind_package(cubeb)\n' CMakeLists.txt || die
	sed -i -e 's/3rdparty::cubeb/cubeb/' rpcs3/Emu/CMakeLists.txt || die

	# Unbundle yaml-cpp: system yaml-cpp should be compiled with -fexceptions
	# sed -i -e '/yaml-cpp/d' 3rdparty/CMakeLists.txt || die
	# sed -i -e '$afind_package(yaml-cpp)\n' CMakeLists.txt || die
	# sed -i -e 's/3rdparty::yaml-cpp/yaml-cpp/' rpcs3/Emu/CMakeLists.txt \
	#	rpcs3/rpcs3qt/CMakeLists.txt || die

	# Fix build with GCC 15
	# https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd
	sed -i '/<algorithm>/a#include <cstdint>' 3rdparty/glslang/glslang/SPIRV/SpvBuilder.h || die

	cmake_src_prepare
}

src_configure() {
	filter-lto

	local mycmakeargs=(
		-DBUILD_LLVM=OFF
		-DBUILD_SHARED_LIBS=OFF # to remove after unbundling
		-DUSE_PRECOMPILED_HEADERS=ON
		-DUSE_LTO=ON
		-DUSE_SDL=ON
		-DUSE_SYSTEM_OPENCV=ON
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_FFMPEG=ON
		-DUSE_SYSTEM_FLATBUFFERS=ON
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_LIBUSB=ON
		-DUSE_SYSTEM_OPENAL=ON
		-DUSE_SYSTEM_PUGIXML=ON
		-DUSE_SYSTEM_SDL=ON
		-DUSE_SYSTEM_XXHASH=ON
		-DUSE_SYSTEM_ZLIB=ON
		-DUSE_DISCORD_RPC=OFF
		-DUSE_FAUDIO=$(usex faudio)
		-DUSE_SYSTEM_OPENCV=$(usex opencv)
		-DUSE_VULKAN=$(usex vulkan)
		-DWITH_LLVM=$(usex llvm)
		$(cmake_use_find_package wayland Wayland)
	)
	# These options are defined conditionally to suppress QA notice
	use faudio && mycmakeargs+=( -DUSE_SYSTEM_FAUDIO=$(usex faudio) )

	cmake_src_configure

	sed -i -e 's/FFMPEG_LIB_AVFORMAT-NOTFOUND/avformat/' -e 's/FFMPEG_LIB_AVCODEC-NOTFOUND/avcodec/' \
		-e 's/FFMPEG_LIB_AVUTIL-NOTFOUND/avutil/' -e 's/FFMPEG_LIB_SWSCALE-NOTFOUND/swscale/' \
		-e 's/FFMPEG_LIB_SWRESAMPLE-NOTFOUND/swresample/' "${BUILD_DIR}"/build.ninja || die
}

src_install() {
	cmake_src_install

	# remove unneccessary files to save some space
	rm -rf "${ED}/usr/share/rpcs3/"{git,test} || die
}
