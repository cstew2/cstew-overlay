# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION=" A frontend for Mupen64Plus "
HOMEPAGE="https://github.com/dh4/mupen64plus-qt.git"
EGIT_REPO_URI="https://github.com/mupen64plus/mupen64plus-ui-python.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/PySDL2[${PYTHON_USEDEP}]
		dev-python/PyQt6[gui,opengl,widgets,${PYTHON_USEDEP}]
		media-libs/libsdl2[joystick,video]"
RDEPEND="games-emulation/mupen64plus-core
		 games-emulation/mupen64plus-qt
		 7z? ( app-arch/p7zip )
		 rar? ( || ( dev-python/rarfile[${PYTHON_USEDEP}]
					 app-arch/unrar
					 app-arch/rar )
		 )
		 ${DEPEND}"
