# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=hatchling
inherit git-r3 distutils-r1

DESCRIPTION="Weave your frames into matplotlib animations"
HOMEPAGE="aliramadhan.me/matplotloom/"
EGIT_REPO_URI="https://github.com/ali-ramadhan/matplotloom.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/optional-ipython.patch" )
