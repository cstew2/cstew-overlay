# Copyright 1999-2020 Gentoo Authors
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
IUSE="test fuzzers artix7 artix7_100t artix7_200t kintex7 zynq7 zynq7010"

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

src_configure() {
	if use test ; then
		local mycmakeargs=(
			-DPRJXRAY_BUILD_TESTING=ON
		)
	fi

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use fuzzers ; then
		if use artix7 ; then
			source "${S}/settings/artix7.sh"
		elif use artix7_100t ; then
			source "${S}/settings/artix7_100t.sh"
		elif use artix7_200t ; then
			source "${S}/settings/artix7_200t.sh"
		elif use kintex7 ; then
			source "${S}/settings/kintex7.sh"
		elif use zynq7 ; then
			source "${S}/settings/zynq7.sh"
		elif use zynq7010 ; then
			source "${S}/settings/zynq7010.sh"
		else
			source "${S}/settings/artix7.sh"
		fi

		cd "${S}/fuzzers/"
		emake build
	fi
}

src_install() {
	cmake_src_install
	dolib.so "${WORKDIR}/${P}_build/lib/liblibprjxray.so"
}
