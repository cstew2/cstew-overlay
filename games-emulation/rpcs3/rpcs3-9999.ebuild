# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic git-r3 xdg

DESCRIPTION="PS3 emulator/debugger"
HOMEPAGE="https://rpcs3.net/"
EGIT_REPO_URI="https://github.com/RPCS3/rpcs3"
EGIT_SUBMODULES+=( '3rdparty/yaml-cpp' )
EGIT_OVERRIDE_COMMIT_RPCS3_YAML_CPP="0b67821f307e8c6bf0eba9b6d3250e3cf1441450"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="alsa? ( media-libs/alsa-lib )
	faudio? ( app-emulation/faudio )
	app-arch/p7zip
	dev-libs/asmjit
	dev-libs/flatbuffers
	dev-libs/hidapi
	dev-libs/libevdev
	dev-libs/pugixml
	dev-libs/xxhash
	dev-libs/wolfssl
	media-libs/cubeb
	media-libs/glew
	media-libs/libpng
	media-libs/libsoundtouch
	media-libs/openal
	media-libs/rtmidi
	qt6? ( dev-qt/qtcore:6
		   dev-qt/qtwidgets:6
		   dev-qt/qtconcurrent
		   dev-qt/qtmultimedia
		   dev-qt/qtsvg )
	net-libs/miniupnpc
	sys-devel/ittapi
	sys-libs/zlib"

RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="alsa discord faudio +llvm qt6 vulkan wayland"

PATCHES=( "${FILESDIR}/unbundle.patch"
		  "${FILESDIR}/code_fixes.patch" )

src_configure() {
	local mycmakeargs=(
		-DUSE_DISCORD_RPC=$(usex discord)
		-DUSE_FAUDIO=$(usex faudio)
		-DUSE_PRECOMPILED_HEADERS=OFF
		-DUSE_LIBEVDEV=ON
		-DUSE_NATIVE_INSTRUCTIONS=ON
		-DUSE_SDL=ON
		-DUSE_SYSTEM_CURL=ON
		-DUSE_SYSTEM_FFMPEG=ON
		-DUSE_SYSTEM_FLATBUFFERS=ON
		-DUSE_SYSTEM_LIBPNG=ON
		-DUSE_SYSTEM_LIBUSB=ON
		-DUSE_SYSTEM_PUGIXML=ON
		-DUSE_SYSTEM_SDL=ON
		-DUSE_SYSTEM_XXHASH=ON
		-DUSE_SYSTEM_ZLIB=ON
		-DUSE_VULKAN=$(usex vulkan)
		-DUSE_SYSTEM_WOLFSSL=ON
		-DWITH_LLVM=$(usex llvm)
	)
	CMAKE_BUILD_TYPE=RELEASE cmake_src_configure
}
