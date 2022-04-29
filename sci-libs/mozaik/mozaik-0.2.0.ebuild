# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="High-level spiking model definition and workflow framework"
HOMEPAGE="https://github.com/CSNG-MFF/mozaik"
SRC_URI="https://github.com/CSNG-MFF/mozaik/archive/refs/tags/v0.2.0.tar.gz"
LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy
		dev-python/sympy
		dev-python/mpi4py
		dev-python/matplotlib
		dev-python/quantities
		dev-python/lazyarray
		dev-python/interval
		dev-python/pillow
		dev-python/param
		dev-python/parameters
		dev-python/neo
		dev-python/cython
		dev-python/pynn
		dev-python/psutil
		dev-python/future
		dev-python/requests
		dev-python/elephant
		test? ( dev-python/pytest-xdist
				dev-python/pytest-timeout
				dev-python/junitparser )"
RDEPEND="${DEPEND}"
BDEPEND=""
