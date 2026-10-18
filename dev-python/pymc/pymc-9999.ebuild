# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Bayesian Modeling and Probabilistic Programming in Python"
HOMEPAGE="www.pymc.io"
EGIT_REPO_URI="https://github.com/pymc-devs/pymc.git"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/arviz
		dev-python/cachetools
		dev-python/cloudpickle
		dev-python/numpy
		dev-python/pandas
		dev-python/pytensor
		dev-python/rich
		dev-python/scipy
		dev-python/threadpoolctl
		dev-python/typing-extensions
		"
RDEPEND="${DEPEND}"
BDEPEND=""
