# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Sparse Cholesky factorization and update/downdate library"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc static-libs"

DEPEND="sci-libs/suitesparseconfig"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		 doc? ( virtual/latex-base )"

S="${WORKDIR}/SuiteSparse-5.8.1/CAMD"

src_compile() {
	emake library
}

src_install() {
	emake INSTALL_LIB="${D}/usr/lib64" \
		  INSTALL_INCLUDE="${D}/usr/include" \
		  -C./Lib install
}
