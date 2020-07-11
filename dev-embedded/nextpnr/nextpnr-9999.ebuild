# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 cmake

DESCRIPTION=""
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
EGIT_REPO_URI="https://github.com/YosysHQ/nextpnr.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fpga_all fpga_generic fpga_ice40 fpga_ecp5"

DEPEND="dev-util/cmake
		dev-qt/qtcore:5
		dev-libs/boost[python]
		dev-cpp/eigen
		dev-embedded/yosys
		fpga_ice40 ? ( dev/embedded/icestorm  )
		fpga_exp5 ? ( dev/embedded/prjtrellis )
		"
RDEPEND="${DEPEND}"
BDEPEND=""


src_configure() {
	if use fpga_all ; then
		local mycmakeargs=(
			-DARCH=all
		)
	elif use fpga_generic ; then
		local mycmakeargs=(
			-DARCH=generic
		)
	elif use fpga_ice40 ; then
		local mycmakeargs=(
			-DARCH=ice40
		)
	elif use fpga_ecp5 ; then
		local mycmakeargs=(
			-DARCH=ecp5
		)
	else
		local mycmakeargs=(
			-DARCH=all
		)
	fi
	cmake_src_configure
}
