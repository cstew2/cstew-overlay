# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="A scikit-learn compatible neural network library that wraps PyTorch"
HOMEPAGE="https://github.com/skorch-dev/skorch"
EGIT_REPO_URI="https://github.com/skorch-dev/skorch.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy
		dev-python/scikit-learn
		dev-python/scipy
		dev-python/tabulate
		dev-python/tqdm
		"
RDEPEND="${DEPEND}"
BDEPEND=""
