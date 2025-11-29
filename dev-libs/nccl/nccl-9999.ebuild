# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake cuda git-r3

DESCRIPTION="Optimized primitives for collective multi-GPU communication"

HOMEPAGE="https://developer.nvidia.com/nccl"
EGIT_REPO_URI="https://github.com/NVIDIA/nccl.git"

LICENSE="Apache-2.0-with-LLVM-exceptions BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nvtx rdma profiler"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
	default
	cmake_src_prepare
	cuda_src_prepare
}

src_configure() {
	default

	local -x ccbin=$(cuda_gccdir -f)
	append-cflags "-I${ESYSROOT}/opt/cuda/include" "{ccbin}"
	append-cppflags "-I${ESYSROOT}/opt/cuda/include"

	local -x LDFLAGS="${LDFLAGS}"
	append-ldflags "-L${ESYSROOT}/opt/cuda/$(get_libdir)"
	cuda_sanitize

	cuda_add_sandbox
	addpredict "/dev/char/"

	cuda_set_CUDAHOSTCXX

	local mycmakeargs=(
		-DCUDA_HOST_COMPILER="${CUDAHOSTCXX}"
		-DNVTX="$(usex nvtx)"
		-DRDMA_CORE="$(usex rdma)"
		-DPROFAPI="$(usex profiler)"
		-DNET_PROFILER="$(usex profiler)"
	)
	cmake_src_configure
}
