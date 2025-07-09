# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake

DESCRIPTION="Documenting the Xilinx 7-series bit-stream format."
HOMEPAGE="https://symbiflow.github.io/prjxray-db/"
EGIT_REPO_URI="https://github.com/SymbiFlow/prjxray.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-embedded/yosys
		dev-embedded/fasm
		dev-embedded/sdf-timing
		dev-cpp/abseil-cpp
		dev-cpp/gtest
		dev-cpp/gflags
		dev-cpp/yaml-cpp
		"
RDEPEND="${DEPEND}"
BDEPEND=""
PATCHES=( ${FILESDIR}/"use_system_libs.patch"
		  ${FILESDIR}/"fix_includes.patch" )

src_configure() {
	if use test ; then
		mycmakeargs+=(
			-DPRJXRAY_BUILD_TESTING=ON
		)
	fi

	sed -i 's/CMAKE_CXX_STANDARD 14/CMAKE_CXX_STANDARD 17/' CMakeLists.txt || die

	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
	dolib.so "${WORKDIR}/${P}_build/lib/liblibprjxray.so"
}
