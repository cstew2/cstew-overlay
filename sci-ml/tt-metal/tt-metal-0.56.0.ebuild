# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( 17..20 )

inherit cmake

DESCRIPTION="TT-NN operator library, and TT-Metalium low level kernel programming model"
HOMEPAGE="https://docs.tenstorrent.com/tt-metal/latest/ttnn/"
SRC_URI="https://github.com/tenstorrent/tt-metal/archive/refs/tags/v0.56.0.tar.gz -> ${P}.tar.gz"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="clang time-trace asan msan tsan ubsan profiler test examples +tt-train +python static-libs"

RDEPEND="sys-apps/hwloc
		 sys-process/numactl
		 python? ( dev-lang/python )
		 clang? ( llvm-core/clang )
		 !clang? ( >=sys-devel/gcc-12 )
		 "
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig
		 dev-libs/boost
		 app-arch/xz-utils"

src_configure() {
	local mycmakeargs=(
		-DCPM_USE_LOCAL_PACKAGES=ON
		-DENABLE_BUILD_TIME_TRACE="$(usex time-trace ON OFF)"
		-DENABLE_ASAN="$(usex asan ON OFF)"
		-DENABLE_MSAN="$(usex msan ON OFF)"
		-DENABLE_TSAN="$(usex tsan ON OFF)"
		-DENABLE_UBSAN="$(usex ubsan ON OFF)"
		-DENABLE_TRACY="$(usex profiler ON OFF)"
		-DBUILD_PROGRAMMING_EXAMPLES="$(usex examples ON OFF)"
		-DBUILD_TT_TRAIN="$(usex examples ON OFF)"
		-DWITH_PYTHON_BINDINGS="$(usex python ON OFF)"
	)

	if use static-libs ; then
		mycmakeargs+=(
			-DENABLE_TTNN_SHARED_SUBLIBS=OFF
			-DBUILD_SHARED_LIBS=OFF
		)
	else
		mycmakeargs+=(
			-DENABLE_TTNN_SHARED_SUBLIBS=ON
			-DBUILD_SHARED_LIBS=ON
		)
	fi

	local value=$(usex test ON OFF)
	mycmakeargs+=(
		-DENABLE_COVERAGE="${value}"
		-DTT_METAL_BUILD_TESTS="${value}"
		-DTT_METAL_BUILD_TESTS="${value}"
		-DTTNN_BUILD_TESTS="${value}"
		-DTT_UMD_BUILD_TESTS="${value}"
	)

	if use clang; then
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

	cmake_src_configure
}
