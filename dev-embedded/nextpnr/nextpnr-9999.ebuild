# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 cmake

DESCRIPTION="place-and-route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
EGIT_REPO_URI="https://github.com/YosysHQ/nextpnr.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="all_fpgas generic ice40 ecp5"

DEPEND="dev-qt/qtcore:5
		dev-libs/boost[python]
		dev-cpp/eigen
		dev-embedded/yosys
		ice40 ? ( dev-embedded/icestorm  )
		ecp5 ? ( dev-embedded/prjtrellis )
		all_fpgas ? ( dev-embedded/icestorm
					  dev-embedded/prjtrellis )
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	if use all_fpgas ; then
		local mycmakeargs=(
			-DARCH=all
		)
	elif use generic ; then
		local mycmakeargs=(
			-DARCH=generic
		)
	elif use ice40 ; then
		local mycmakeargs=(
			-DARCH=ice40
		)
	elif use ecp5 ; then
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
