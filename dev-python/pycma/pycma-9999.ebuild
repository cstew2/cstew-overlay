# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools

inherit git-r3 distutils-r1

DESCRIPTION="Python implementation of CMA-ES"
HOMEPAGE="https://github.com/CMA-ES/pycma/"
EGIT_REPO_URI="https://github.com/CMA-ES/pycma.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(${FILESDIR}/"fix_setuptools.patch")
