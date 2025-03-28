# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 git-r3

DESCRIPTION="Fast spike sorting with drift correction"
HOMEPAGE="https://kilosort.readthedocs.io/en/latest/"
EGIT_REPO_URI="https://github.com/MouseLand/Kilosort.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="docs gui test"

DEPEND="dev-libs/faiss
		dev-python/numba
		dev-python/numpy
		dev-python/scipy
		dev-python/scikit-learn
		dev-python/tqdm
		sci-libs/pytorch
		gui? ( dev-python/pyqtgraph
			   dev-python/qtpy
			   dev-python/qtpy6
			   dev-python/matplotlib )"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
