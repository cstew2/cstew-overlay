# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=(python3_{13,14})

inherit git-r3 distutils-r1

DESCRIPTION="Comprehensive optical design, optimization, and analysis in Python"
HOMEPAGE="optiland.readthedocs.io/"
EGIT_REPO_URI="https://github.com/HarrisonKramer/optiland.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+pytorch"

RDEPEND=""
DEPEND="${RDEPEND}
		dev-python/numpy
		dev-python/scipy
		dev-python/pandas
		dev-python/pyyaml
		dev-python/matplotlib
		sci-libs/vtk
		dev-python/tabulate
		dev-python/numba
		dev-python/requests
		dev-python/seaborn
		pytorch? ( sci-ml/pytorch )
"
BDEPEND=""
