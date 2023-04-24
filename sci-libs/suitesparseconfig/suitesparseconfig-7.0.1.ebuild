# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Common configurations for all packages in suitesparse"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/refs/tags/v${PV}.tar.gz -> SuiteSparse-${PV}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="+cuda +openmp static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/SuiteSparse-${PV}/SuiteSparse_config"

src_configure() {
	local mycmakeargs=(
		-DENABLE_CUDA="$(usex cuda ON OFF)"
		-DSUITESPARSE_CUDA_ARCHITECTURES="${SUITESPARSE_CUDA_ARCHITECTURES}"
		-DNOPENMP="$(usex openmp OFF ON)"
	)
	cmake_src_configure
}
