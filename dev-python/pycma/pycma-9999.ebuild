# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

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
