# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Unsymmetric multifrontal sparse LU factorization library"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc +cholmod +openmp static-libs"

DEPEND="sci-libs/amd
		sci-libs/suitesparseconfig
		virtual/blas
		cholmod? ( sci-libs/cholmod )"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		 doc? ( virtual/latex-base )"

S="${WORKDIR}/SuiteSparse-${PV}/UMFPACK"

src_configure() {
	local mycmakeargs=(
		-DNOPENMP="$(usex openmp OFF ON)"
	)
	cmake_src_configure
}
