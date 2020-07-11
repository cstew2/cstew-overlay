# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 cmake

DESCRIPTION="Experimental flows using nextpnr for Xilinx devices"
HOMEPAGE="https://github.com/daveshah1/nextpnr-xilinx.git"
EGIT_REPO_URI="https://github.com/daveshah1/nextpnr-xilinx"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/cmake
		dev-qt/qtcore:5
		dev-libs/boost[python]
		dev-cpp/eigen
		dev-embedded/yosys
		dev-embedded/x-ray
		dev-embedded/x-ray-db
		"
RDEPEND="${DEPEND}"
BDEPEND=""


src_configure() {
	local mycmakeargs=(
		-DARCH=xilinx
	)

	cmake_src_configure
}
