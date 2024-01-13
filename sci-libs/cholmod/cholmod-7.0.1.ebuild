# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Sparse Cholesky factorization and update/downdate library"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE=c"uda doc +lapack +matrixops +modify +openmp +partition static-libs"

DEPEND="
	sci-libs/amd
	sci-libs/colamd
	cuda? ( x11-drivers/nvidia-drivers dev-util/nvidia-cuda-toolkit )
	lapack? ( virtual/lapack )
	partition? (
		sci-libs/camd
		sci-libs/ccolamd
		|| ( sci-libs/metis sci-libs/parmetis ) )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/SuiteSparse-${PV}/CHOLMOD"

src_configure() {
	local mycmakeargs=(
		-DENABLE_CUDA="$(usex cuda ON OFF)"
		-DSUITESPARSE_CUDA_ARCHITECTURES="${SUITESPARSE_CUDA_ARCHITECTURES}"
		-DNOPENMP="$(usex openmp OFF ON)"
	)
	cmake_src_configure
}
