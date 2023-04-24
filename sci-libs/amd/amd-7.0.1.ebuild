# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Library to order a sparse matrix prior to Cholesky factorization"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc fortran static-libs"

DEPEND="sci-libs/suitesparseconfig"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( virtual/latex-base )
		 virtual/pkgconfig"

S="${WORKDIR}/SuiteSparse-${PV}/AMD"
