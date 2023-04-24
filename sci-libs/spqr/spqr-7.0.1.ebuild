# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Multithreaded multifrontal sparse QR factorization library"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="+cuda doc +openmp partition static-libs tbb"

DEPEND="virtual/lapack
		sci-libs/suitesparse_gpuruntime
		sci-libs/gpuqrengine
		sci-libs/cholmod[lapack,partition?]
		partition? ( sci-libs/metis )
		tbb? ( dev-cpp/tbb )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/SuiteSparse-${PV}/SPQR"

src_configure() {
	local mycmakeargs=(
		-DENABLE_CUDA="$(usex cuda ON OFF)"
		-DSUITESPARSE_CUDA_ARCHITECTURES="${SUITESPARSE_CUDA_ARCHITECTURES}"
		-DNOPENMP="$(usex openmp OFF ON)"
	)
	cmake_src_configure
}
