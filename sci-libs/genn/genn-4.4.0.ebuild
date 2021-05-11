# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cuda

DESCRIPTION="A GPU Neuronal Network simulation using code generation for CUDA"
HOMEPAGE="https://genn-team.github.io/genn/"
SRC_URI="https://github.com/genn-team/genn/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="3"
KEYWORDS="~amd64"
IUSE="cuda opencl mpi"
RESTRICT=""

RDEPEND=""
DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	opencl? ( virtual/opencl )
	mpi? ( virtual/mpi )
"
src_prepare() {
	cuda_src_prepare
	default
	#use lib64 for building makefile
	sed -i -e 's~$(PREFIX)/lib~$(PREFIX)/lib64~' Makefile

	#use lib64 for code generation common makefile
	sed -i -e 's~$(GENN_DIR)/lib~$(GENN_DIR)/lib64~' src/genn/MakefileCommon
}

src_compile() {
	local myopts=()
	use cuda && myopts+=(CUDA_PATH="${EPREFIX}"/opt/cuda/)
	use opencl && myopts+=(OPENCL_PATH="${EPREFIX}"/usr/include/CL)
	#use mpi && myopts+=(MPI_ENABLE=1)
	emake "${myopts[@]}" all
}

src_install() {
	emake install PREFIX="${D}"/usr
}
