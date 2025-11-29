# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools

inherit git-r3 distutils-r1

DESCRIPTION="gnuplot for numpy"
HOMEPAGE="https://github.com/dkogan/gnuplotlib"
EGIT_REPO_URI="https://github.com/dkogan/gnuplotlib.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy
		dev-python/numpysane"
RDEPEND="${DEPEND}"
BDEPEND=""
