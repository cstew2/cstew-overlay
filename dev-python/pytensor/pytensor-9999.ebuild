# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="PyTensor allows you to define, optimize, and efficiently multi-dimensional arrays."
HOMEPAGE="pytensor.readthedocs.io"
EGIT_REPO_URI="https://github.com/pymc-devs/pytensor.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/scipy
		dev-python/numpy
		dev-python/numba
		dev-python/filelock
		dev-python/etuples
		dev-python/logical-unification
		dev-python/minikanren
		dev-python/cons
		"
RDEPEND="${DEPEND}"
BDEPEND=""
