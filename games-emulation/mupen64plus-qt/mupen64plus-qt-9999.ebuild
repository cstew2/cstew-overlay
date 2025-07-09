# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="A fork of Mupen64 Nintendo 64 emulator, meta-package"
HOMEPAGE="https://github.com/dh4/mupen64plus-qt"
EGIT_REPO_URI="https://github.com/dh4/mupen64plus-qt.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtbase:6[network,xml,sql,widgets]
		dev-libs/quazip[qt6]"
RDEPEND="games-emulation/mupen64plus-core
		 ${DEPEND}"

PATCHES=( "${FILESDIR}/fix_build.patch" )
