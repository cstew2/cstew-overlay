# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})
DISTUTILS_USE_PEP517=flit

inherit distutils-r1

DESCRIPTION="Stats, linear algebra and einops for xarray"
HOMEPAGE="https://einstats.python.arviz.org/en/latest/"
SRC_URI="https://github.com/arviz-devs/xarray-einstats/archive/refs/tags/v0.3.0.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/xarray
		dev-python/numpy
		dev-python/scipy"
RDEPEND="${DEPEND}"
BDEPEND=""
