# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Sparse LU factorization for circuit simulation"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc static-libs"

DEPEND="sci-libs/amd
		sci-libs/btf
		sci-libs/colamd"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		 doc? ( virtual/latex-base )"

S="${WORKDIR}/SuiteSparse-${PV}/KLU"
