# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font git-r3

DESCRIPTION=" The Crimson Text typeface "
HOMEPAGE="https://github.com/skosch/Crimson"
EGIT_REPO_URI="https://github.com/skosch/Crimson.git"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
IUSE=""

src_compile() {
	:
}

src_install() {
	cd "${S}/Desktop Fonts"
	FONT_S="./TTF" FONT_SUFFIX="ttf" font_src_install
	FONT_S="./OTF" FONT_SUFFIX="otf" font_src_install
}
