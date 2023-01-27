# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Unsymmetric multifrontal sparse LU factorization library"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc +cholmod static-libs"

DEPEND="sci-libs/amd
		sci-libs/suitesparseconfig
		virtual/blas
		cholmod? ( sci-libs/cholmod )"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		 doc? ( virtual/latex-base )"

S="${WORKDIR}/SuiteSparse-5.8.1/UMFPACK"

src_compile() {
	emake library
}

src_install() {
	emake INSTALL_LIB="${D}/usr/lib64" \
		  INSTALL_INCLUDE="${D}/usr/include" \
		  -C./Lib install
}
