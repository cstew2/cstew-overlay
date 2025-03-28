# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 git-r3

DESCRIPTION="Python package to handle probe layout, geometry and wiring to device"
HOMEPAGE="https://github.com/SpikeInterface/probeinterface"
EGIT_REPO_URI="https://github.com/SpikeInterface/probeinterface.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docs gui test"

DEPEND="dev-python/h5py
		dev-python/matplotlib
		dev-python/pandas
		dev-python/scipy
		dev-python/zarr"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
