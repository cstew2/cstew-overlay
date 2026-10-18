# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="CUDA Python: Performance meets Productivity"
HOMEPAGE="nvidia.github.io/cuda-python/"
EGIT_REPO_URI="https://github.com/NVIDIA/cuda-python.git"
EGIT_COMMIT="${PN}-v${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="test? ( dev-python/pytest
				 dev-python/pytest-mock
				 dev-python/pytest-repeat
				 dev-python/pytest-readomly
				 dev-python/pytest-run-parallel )"
DEPEND="${RDEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}/cuda_pathfinder/"
