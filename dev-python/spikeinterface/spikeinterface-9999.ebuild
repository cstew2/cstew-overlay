# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Fast spike sorting with drift correction"
HOMEPAGE="spikeinterface.readthedocs.io"
EGIT_REPO_URI="https://github.com/SpikeInterface/spikeinterface.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docs gui test"

DEPEND="dev-python/numpy
		dev-python/threadpoolctl
		dev-python/tqdm
		dev-python/zarr
		dev-python/neo
		dev-python/probeinterface
		dev-python/packaging"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
