# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})
EGIT_SUBMODULES=()

inherit git-r3 cmake distutils-r1

DESCRIPTION="Tiny and efficient C++/Python bindings"
HOMEPAGE="https://github.com/wjakob/nanobind/"
EGIT_REPO_URI="https://github.com/wjakob/nanobind.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

DEPEND="cuda? ( dev-util/nvidia-cuda-toolkit
				dev-libs/cudnn )
		dev-libs/flatbuffers

		dev-python/numpy
		dev-python/scipy

"
RDEPEND="${DEPEND}"

EPYTEST_PLUGINS=()
EPYTEST_XDIST=1
