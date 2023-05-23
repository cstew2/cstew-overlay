# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Multithreaded multifrontal sparse QR factorization library"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc partition static-libs tbb"

DEPEND="virtual/lapack
		sci-libs/suitesparse_gpuruntime
		sci-libs/gpuqrengine
		sci-libs/cholmod[lapack,partition?]
		partition? ( sci-libs/metis )
		tbb? ( dev-cpp/tbb )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/SuiteSparse-5.8.1/SPQR"

src_compile() {
	cd ..
	eapply "${FILESDIR}/no_cuda-arch-3.5.patch"
	cd "${S}"
	emake library
}

src_install() {
	emake INSTALL_LIB="${D}/usr/lib64" \
		  INSTALL_INCLUDE="${D}/usr/include" \
		  -C./Lib install
}
