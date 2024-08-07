# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

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
		ice40? ( dev-embedded/icestorm  )
		ecp5? ( dev-embedded/trellis )
		all_fpgas? ( dev-embedded/icestorm
					 dev-embedded/trellis )
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
