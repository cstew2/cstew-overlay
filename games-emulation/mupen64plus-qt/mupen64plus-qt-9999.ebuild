# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION="A fork of Mupen64 Nintendo 64 emulator, meta-package"
HOMEPAGE="https://github.com/dh4/mupen64plus-qt"
EGIT_REPO_URI="https://github.com/dh4/mupen64plus-qt.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtcore:5
		dev-qt/qtnetwork:5
		dev-qt/qtxml:5
		dev-qt/qtwidgets:5
		dev-qt/qtsql:5
		dev-libs/quazip"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/quazip.patch" )

src_configure() {
	eqmake5
}

src_install() {
	dobin "${PN}"
	dodoc "README.md"
	doman "resources/${PN}.6"
}
