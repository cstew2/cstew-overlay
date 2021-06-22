# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Create X11 pointer barriers around your working area"
HOMEPAGE="https://www.uninformativ.de/git/xpointerbarrier/file/README.html"
EGIT_REPO_URI="https://www.uninformativ.de/git/xpointerbarrier.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="x11-libs/libX11
		 x11-libs/libXfixes
		 x11-libs/libXrandr"
DEPEND="${RDEPEND}
	   "

PATCHES=( "${FILESDIR}/ldflags_fix.patch" )

src_install() {
	emake prefix=/usr DESTDIR="${D}" install
}
