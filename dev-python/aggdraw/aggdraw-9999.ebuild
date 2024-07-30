# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit git-r3 distutils-r1

DESCRIPTION="Python package wrapping AGG2 drawing functionality"
HOMEPAGE="aggdraw.readthedocs.io/"
EGIT_REPO_URI="https://github.com/pytroll/aggdraw.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
