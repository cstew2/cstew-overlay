# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ROCM_VERSION=6.1
LLVM_COMPAT=( {14..20} )
inherit git-r3 cuda rocm llvm-r1 cmake

DESCRIPTION="Implementation of SYCL and C++ standard parallelism"
HOMEPAGE="adaptivecpp.github.io/ "
EGIT_REPO_URI="https://github.com/AdaptiveCpp/AdaptiveCpp.git"

LICENSE="BSD-2"
SLOT="0"
IUSE="clang cuda opencl nvc++ rocm"
REQUIRED_USE="rocm? ( ${ROCM_REQUIRED_USE} )"

RDEPEND=""
DEPEND="${RDEPEND}
		cuda? ( dev-util/nvidia-cuda-toolkit )
		rocm? ( dev-libs/hip )
		opencl? ( virtual/opencl )
		dev-libs/boost
		dev-util/spirv-llvm-translator
		llvm-core/llvm"
BDEPEND=""

PATCHES=( "${FILESDIR}/fix_dirs.patch" )

src_configure() {
	if use clang; then
		# Force clang
		einfo "Enforcing the use of clang due to USE=clang ..."

		local version_clang=$(clang --version 2>/dev/null | grep -F -- 'clang version' | awk '{ print $3 }')
		[[ -n ${version_clang} ]] && version_clang=$(ver_cut 1 "${version_clang}")
		[[ -z ${version_clang} ]] && die "Failed to read clang version!"

		if tc-is-gcc; then
			have_switched_compiler=yes
		fi

		AR=llvm-ar
		CC=${CHOST}-clang-${version_clang}
		CXX=${CHOST}-clang++-${version_clang}
		NM=llvm-nm
		RANLIB=llvm-ranlib

		strip-unsupported-flags
	fi

	if use rocm; then
		local amdgpu_flags=$(get_amdgpu_flags)
		export HCC_AMDGPU_TARGET=${amdgpu_flags//;/,}
	fi

	local mycmakeargs=(
		-DACPP_CONFIG_FILE_GLOBAL_INSTALLATION=ON
		-DLLVM_TOOL_SPIRV_HEADERS_BUILD=ON
		-DCLANG_INCLUDE_PATH=$(get_llvm_prefix)
		-DWITH_OPENCL_BACKEND=$(usex opencl)
		-DWITH_LEVEL_ZERO_BACKEND=OFF
		-DWITH_ROCM_BACKEND=$(usex rocm)
		-DWITH_CUDA_BACKEND=$(usex cuda)
		-DACPP_COMPILER_FEATURE_PROFILE=full
	)
	cmake_src_configure
}

src_install() {
	default
	cmake_src_install
	newenvd - 99acpp <<-EOF
		PATH=/usr/lib64/hipSYCL/ext/llvm-spirv/bin
		LDPATH=/usr/lib64/hipSYCL/:/usr/lib64/hipSYCL/llvm-to-backend/:/usr/lib64/hipSYCL/bitcode/:/usr/lib64/hipSYCL/ext/llvm-spirv/lib64
	EOF
}

src_test() {
	use rocm && check_amdgpu
	default
}
