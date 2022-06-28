# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cuda cmake

DESCRIPTION="CUDA Templates for Linear Algebra Subroutines"
HOMEPAGE="https://github.com/NVIDIA/cutlass"
SRC_URI="https://github.com/NVIDIA/cutlass/archive/refs/tags/v2.9.0.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc cudnn +cublas test"

BDEPEND="doc? ( app-doc/doxygen )"
DEPEND="dev-util/nvidia-cuda-toolkit
		cudnn? ( dev-libs/cudnn )"

src_configure() {
	local mycmakeargs=(
		-DCUTLASS_ENABLE_CUBLAS="$(usex cublas ON OFF)"
		-DCUTLASS_ENABLE_CUDNN="$(usex cudnn ON OFF)"
		-DCUTLASS_ENABLE_TESTS="$(usex test ON OFF)"
		-DCUTLASS_NVCC_ARCHS="${CUTLASS_CUDA_SUPPORT}"
	)
	cmake_src_configure
}
