# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})
DISTUTILS_USE_PEP517=poetry

inherit git-r3 distutils-r1

DESCRIPTION="A Python implementation of global optimization with gaussian processes."
HOMEPAGE="https://github.com/bayesian-optimization/BayesianOptimization"
EGIT_REPO_URI="https://github.com/bayesian-optimization/BayesianOptimization.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=">=dev-python/numpy-1.9.0
		>=dev-python/scipy-1.0.0
		>=dev-python/scikit-learn-0.18.0
		>=dev-python/colorama-0.4.6"
RDEPEND="${DEPEND}"
BDEPEND=""
