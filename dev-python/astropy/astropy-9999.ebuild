# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})
inherit git-r3 distutils-r1

DESCRIPTION="Core functionality for performing astrophysics with Python"
HOMEPAGE="https://www.astropy.org/"
EGIT_REPO_URI="https://github.com/astropy/astropy.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pyerfa[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	virtual/zlib
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-python/extension-helpers[${PYTHON_USEDEP}]
	test? (
		dev-libs/libxml2
		dev-python/h5py[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/objgraph[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/fix_setup.patch" )
