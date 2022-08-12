# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A C compiler for 6502-based systems"
HOMEPAGE="https://cc65.github.io/"
EGIT_REPO_URI="https://github.com/cc65/cc65.git"

LICENSE="ZLIB"
IUSE="doc"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/linuxdoc-tools )"

src_compile() {
	emake PREFIX="/usr"
	use doc && emake -C doc
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" DESTPACKAGE_SUFFIX="-${PV}" install
}
