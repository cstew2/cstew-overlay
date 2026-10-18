# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 git-r3

DESCRIPTION="Implementation of Unconstrained Monotonic Neural Network"
HOMEPAGE="https://github.com/AWehenkel/UMNN"
EGIT_REPO_URI="https://github.com/AWehenkel/UMNN.git"
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy
		dev-python/scipy
		dev-python/black
		dev-python/flake8
		sci-ml/pytorch
		"
RDEPEND="${DEPEND}"
BDEPEND=""
