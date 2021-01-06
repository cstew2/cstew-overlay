# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

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
PATCHES=( "${FILESDIR}/use_system_libs.patch" )


src_configure() {
	if use test ; then
		mycmakeargs+=(
			-DPRJXRAY_BUILD_TESTING=ON
		)
	fi

	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
	dolib.so "${WORKDIR}/${P}_build/lib/liblibprjxray.so"
}
