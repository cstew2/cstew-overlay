# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="A basic Python library for reading, writing, display, and simple processing of SAR data"
HOMEPAGE="https://github.com/numba/numba.git"
EGIT_REPO_URI="https://github.com/ngageoint/sarpy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docs extra test"

DEPEND="dev-python/scipy
		dev-python/numpy
		extra? ( dev-python/lxml
				dev-python/shapely
				dev-python/networkx
				dev-python/pyproj )
		docs? ( dev-python/sphinx )
		"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
