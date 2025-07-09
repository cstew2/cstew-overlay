# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Elephant is the Electrophysiology Analysis Toolkit"
HOMEPAGE="https://github.com/NeuralEnsemble/elephant.git"
SRC_URI="https://github.com/NeuralEnsemble/elephant/archive/refs/tags/v0.11.1.tar.gz -> ${P}"
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/scipy
		dev-python.six
		dev-python/neo
		dev-python/numpy
		dev-python/quantities
		dev-python/tqdm"
RDEPEND="${DEPEND}"
BDEPEND=""
