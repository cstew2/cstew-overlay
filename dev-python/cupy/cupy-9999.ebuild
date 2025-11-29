# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit cuda git-r3 distutils-r1

DESCRIPTION="NumPy & SciPy for GPU"
HOMEPAGE="cupy.dev"
EGIT_REPO_URI="https://github.com/cupy/cupy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cudnn nccl optuna +scipy test"

RDEPEND=""
DEPEND="${RDEPEND}
		cudnn? ( dev-libs/cudnn )
		nccl? ( dev-libs/nccl )
		scipy? ( dev-python/scipy )
		optuna? ( dev-python/optuna )
		dev-python/numpy
		dev-python/fastrlock
		dev-python/mypy
		test? ( dev-python/pytest
				dev-python/hypothesis
				dev-python/mpmath )"
BDEPEND=""

src_configure() {
	default
	export NVCC="nvcc $(cuda_gccdir -f)"
}
