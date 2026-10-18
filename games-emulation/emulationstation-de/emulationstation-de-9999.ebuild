# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Emulation frontend GUI"
HOMEPAGE="https://es-de.org/"
EGIT_REPO_URI="https://gitlab.com/es-de/emulationstation-de.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ffmpeg gles opengl"

RDEPEND="app-text/poppler
		 dev-libs/boost
		 dev-libs/icu
		 dev-libs/libgit2
		 dev-libs/pugixml
		 dev-libs/rapidjson
		 llvm-core/clang
		 media-fonts/droid
		 media-libs/alsa-lib
		 media-libs/harfbuzz
		 media-libs/libsdl2
		 media-libs/sdl2-mixer
		 media-libs/freeimage
		 media-libs/nanosvg
		 media-libs/libpulse
		 media-sound/id3v2
		 media-video/ffmpeg
		 net-misc/curl
		 sys-devel/gettext
		 "
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		"-DGL=$(usex opengl)"
		"-DGLES=$(usex gles)"
		"-DVIDEO_HW_DECODING=$(usex ffmpeg)"
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
