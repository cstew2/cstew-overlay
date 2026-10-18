# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION="A customizable graphical frontend for launching emulators and managing your game collection"
HOMEPAGE="pegasus-frontend.org"
EGIT_REPO_URI="https://github.com/mmatyas/pegasus-frontend.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtbase:6
		 dev-qt/qtdeclarative:6
		 dev-qt/qtmultimedia:6[qml]
		 dev-qt/qtsvg"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	eqmake6 INSTALL_BINDIR \
			ENABLE_APNG=1
}
