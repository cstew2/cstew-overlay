# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Neo is a package for representing electrophysiology data in Python"
HOMEPAGE="https://github.com/NeuralEnsemble/python-neo"
SRC_URI="https://github.com/NeuralEnsemble/python-neo/archive/refs/tags/0.10.0.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy
		dev-python/quantities"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/python-${P}"
