# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="GPUQREngine is a gpu-accelerated QR factorization engine."
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc cuda static-libs"

DEPEND="cuda? ( x11-drivers/nvidia-drivers dev-util/nvidia-cuda-toolkit )
		sci-libs/suitesparseconfig
		sci-libs/suitesparse_gpuruntime"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/SuiteSparse-${PV}/GPUQREngine"

src_configure() {
	local mycmakeargs=(
		-DENABLE_CUDA="$(usex cuda ON OFF)"
		-DSUITESPARSE_CUDA_ARCHITECTURES="${SUITESPARSE_CUDA_ARCHITECTURES}"
	)
	cmake_src_configure
}
