# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11,12})

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
		>=sci-libs/scikit-learn-0.18.0
		>=dev-python/colorama-0.4.6"
RDEPEND="${DEPEND}"
BDEPEND=""
