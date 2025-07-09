# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="A cross-platform GUI automation Python module for human beings"
HOMEPAGE="https://github.com/asweigart/pyautogui"
EGIT_REPO_URI="https://github.com/asweigart/pyautogui.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
