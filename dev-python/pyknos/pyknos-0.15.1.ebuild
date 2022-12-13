# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Generic API for dispatch to Pyro backends."
HOMEPAGE="https://pyro.ai/api"
SRC_URI="https://github.com/mackelab/pyknos/archive/refs/tags/v0.15.1.tar.gz -> ${P}.tar.gz"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/matplotlib
		>=dev-python/nflows-0.14
		dev-python/numpy
		sci-libs/pytorch
		dev-python/tqdm"
RDEPEND="${DEPEND}"
BDEPEND=""
