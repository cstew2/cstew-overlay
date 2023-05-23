# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic git-r3 xdg

DESCRIPTION="PS3 emulator/debugger"
HOMEPAGE="https://rpcs3.net/"
EGIT_REPO_URI="https://github.com/RPCS3/rpcs3"
EGIT_SUBMODULES=( '3rdparty/wolfssl' )

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="alsa? ( media-libs/alsa-lib )
	app-emulation/faudio
	pulseaudio? ( media-sound/pulseaudio )
	app-arch/p7zip
	dev-libs/asmjit
	dev-libs/flatbuffers
	>=dev-libs/hidapi-0.13.1
	dev-libs/libevdev
	dev-libs/pugixml
	dev-libs/xxhash
	dev-libs/wolfssl
	dev-qt/qtconcurrent
	dev-qt/qtdbus
	dev-qt/qtmultimedia[widgets]
	dev-qt/qtsvg
	dev-qt/qtwidgets
	media-libs/cubeb
	media-libs/glew
	media-libs/libpng
	media-libs/libsoundtouch
	media-libs/openal
	net-libs/miniupnpc
	sys-libs/zlib
	dev-cpp/yaml-cpp
	media-libs/vulkan-loader"
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="alsa +llvm pulseaudio vulkan wayland"

PATCHES=("${FILESDIR}/unbundle.patch")

src_prepare() {
	append-cflags -DNDEBUG -Wno-error=stringop-truncation
	append-cppflags -DNDEBUG -Wno-error=stringop-truncation
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_LLVM_SUBMODULE=OFF
		-DBUILD_SHARED_LIBS=YES
		-DUSE_DISCORD_RPC=OFF
		-DUSE_FAUDIO=ON
		-DUSE_LIBEVDEV=ON
		-DUSE_PRECOMPILED_HEADERS=OFF
		-DUSE_SDL=ON
		-DUSE_SYSTEM_ASMJIT=ON
		-DUSE_SYSTEM_CUBEB=ON
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_FAUDIO=ON
		-DUSE_SYSTEM_FFMPEG=ON
		-DUSE_SYSTEM_FLATBUFFERS=ON
		-DUSE_SYSTEM_GLSLANG=ON
		-DUSE_SYSTEM_HIDAPI=ON
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_LIBUSB=ON
		-DUSE_SYSTEM_PUGIXML=ON
		-DUSE_SYSTEM_MINIUPNPC=ON
		-DUSE_SYSTEM_SDL=ON
		-DUSE_SYSTEM_SPIRV_HEADERS_TOOLS=ON
		-DUSE_SYSTEM_SOUNDTOUCH=ON
		-DUSE_SYSTEM_WOLFSSL=ON
		-DUSE_SYSTEM_XXHASH=ON
		-DUSE_SYSTEM_YAML_CPP=ON
		-DUSE_SYSTEM_ZLIB=ON
		-DUSE_VULKAN=$(usex vulkan)
		-DWITH_LLVM=$(usex llvm)
	)
	cmake_src_configure
}
