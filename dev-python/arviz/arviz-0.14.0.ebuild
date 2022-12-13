# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Exploratory analysis of Bayesian models with Python "
HOMEPAGE="https://python.arviz.org/en/stable/"
SRC_URI="https://github.com/arviz-devs/arviz/archive/refs/tags/0.14.0.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=">=dev-python/matplotlib-3.5
		>=dev-python/numpy-1.20.0
		>=dev-python/scipy-1.8.0
		>=dev-python/pandas-1.4.0
		>=dev-python/xarray-0.21.0
		dev-python/netcdf4-python
		>=dev-python/typing-extensions-4.1.0
		>=dev-python/xarray-einstats-0.3"
RDEPEND="${DEPEND}"
BDEPEND=""
