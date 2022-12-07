# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://www.mackelab.org/sbi/"
SRC_URI="https://github.com/pyro-ppl/pyro/archive/refs/tags/1.8.3.tar.gz -> ${P}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=">=dev-python/numpy-1.7
		>=dev-python/opt-einsum-2.3.2
		>=dev-python/pyro-api-0.1.1
		>=dev-python/pytorch-1.11.0
		>=dev-python/tqdm-4.36"
RDEPEND="${DEPEND}"
BDEPEND=""
