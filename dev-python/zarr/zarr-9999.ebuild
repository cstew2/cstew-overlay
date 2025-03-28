# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 git-r3

DESCRIPTION="An implementation of chunked, compressed, N-dimensional arrays for Python"
HOMEPAGE="zarr.readthedocs.io"
EGIT_REPO_URI="https://github.com/zarr-developers/zarr-python.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-python/asciitree
		dev-python/numpy
		dev-python/fasteners
		dev-python/numcodecs
		dev-python/crc32c
		dev-python/zstandard
		dev-python/donfig
		dev-python/fsspec
		dev-python/typing-extensions"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
