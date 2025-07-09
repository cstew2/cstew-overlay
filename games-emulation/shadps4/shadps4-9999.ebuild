# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="https://foo.example.org/"
SRC_URI="ftp://foo.example.org/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="clang gui"

RDEPEND="dev-cpp/toml11
		 dev-libs/libfmt
		 dev-libs/pugixml
		 dev-libs/rapidjson
		 dev-libs/stb
		 dev-libs/xbyak
		 dev-libs/xxhash
		 dev-util/glslang
		 dev-util/vulkan-headers
		 dev-util/vulkan-tools
		 media-libs/alsa-lib
		 media-libs/libpng
		 media-libs/libsdl2
		 media-libs/openal
		 media-libs/vulkan-layers
		 media-libs/vulkan-loader
		 media-sound/sndio
		 media-video/ffmpeg
		 sys-libs/zlib
		 gui? ( dev-qt/qtbase
				dev-qt/qtdeclarative
				dev-qt/qtmultimedia
				dev-qt/qtsvg
				dev-qt/qttools )"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DENABLE_QT_GUI=$(usex gui)
		-DENABLE_DISCORD_RPC=OFF
		-DENABLE_UPDATER=OFF
	)

	cmake_src_configure
}
