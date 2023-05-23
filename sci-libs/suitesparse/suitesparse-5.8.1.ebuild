# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Metapackage for a suite of sparse matrix tools"
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"

LICENSE="metapackage"
SLOT="0"

KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="cuda doc lapack partition tbb"
DEPEND=""
RDEPEND="
	sci-libs/suitesparseconfig
	sci-libs/suitesparse_gpuruntime[cuda?]
	sci-libs/gpuqrengine[cuda?]
	sci-libs/amd[doc?]
	sci-libs/btf
	sci-libs/camd[doc?]
	sci-libs/ccolamd
	sci-libs/cholmod[cuda?,doc?,partition?,lapack?]
	sci-libs/colamd
	sci-libs/cxsparse
	sci-libs/klu[doc?]
	sci-libs/ldl[doc?]
	sci-libs/spqr[doc?,partition?,tbb?]
	sci-libs/umfpack[doc?,cholmod]"
