# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="A Python toolbox for performing gradient-free optimization"
HOMEPAGE="https://facebookresearch.github.io/nevergrad/"
EGIT_REPO_URI="https://github.com/facebookresearch/nevergrad.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=">=dev-python/numpy-1.24.0
		>=dev-python/pycma-2.6.0
		>=dev-python/typing-extensions-3.6.6
		>=dev-python/bayesian-optimization-1.2.0
		dev-python/pandas
	   "
RDEPEND="${DEPEND}"
BDEPEND=""
