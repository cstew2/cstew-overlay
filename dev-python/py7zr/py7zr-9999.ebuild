# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="7zip in python3 with ZStandard, PPMd, LZMA2, LZMA1, Delta, BCJ, BZip2, and Deflate compressions, and AES encryption."
HOMEPAGE="https://github.com/miurahr/py7zr"
EGIT_REPO_URI="https://github.com/miurahr/py7zr.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test doc"

RDEPEND="
		dev-python/texttable[${PYTHON_USEDEP}]
		dev-python/pycryptodomex[${PYTHON_USEDEP}]
		dev-python/brotlicffi[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyppmd[${PYTHON_USEDEP}]
		dev-python/pybcj[${PYTHON_USEDEP}]
		dev-python/multivolumefile[${PYTHON_USEDEP}]
		dev-python/inflate64[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-remotedata[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/coveralls[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
	doc? (
		 dev-python/sphinx[${PYTHON_USEDEP}]
		 dev-python/sphinx-py3doc-enhanced-theme[${PYTHON_USEDEP}]
		 dev-python/sphinx-a4doc[${PYTHON_USEDEP}]
		 dev-python/docutils[${PYTHON_USEDEP}]
	)
"
