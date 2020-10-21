# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="SuiteSparse_GPURuntime provides helper functions for the GPU."
HOMEPAGE="https://faculty.cse.tamu.edu/davis/suitesparse.html"
SRC_URI="https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="cuda doc static-libs"

DEPEND="cuda? ( x11-drivers/nvidia-drivers dev-util/nvidia-cuda-toolkit )
		sci-libs/suitesparseconfig"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/SuiteSparse-5.8.1/SuiteSparse_GPURuntime"

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
