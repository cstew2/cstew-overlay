# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cuda git-r3

DESCRIPTION="A GPU Neuronal Network simulation using code generation for CUDA"
HOMEPAGE="https://genn-team.github.io/genn/"
EGIT_REPO_URI="https://github.com/genn-team/genn.git"

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
}

src_compile() {
	local myopts=(PREFIX=/usr)
	use cuda && myopts+=(CUDA_PATH="${EPREFIX}"/opt/cuda/)
	use opencl && myopts+=(OPENCL_PATH="${EPREFIX}"/usr/include/CL)
	#use mpi && myopts+=(MPI_ENABLE=1)
	emake "${myopts[@]}" all
}

src_install() {
	emake install PREFIX="${D}"/usr
}
