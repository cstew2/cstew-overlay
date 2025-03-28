# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake

DESCRIPTION="place-and-route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
EGIT_REPO_URI="https://github.com/YosysHQ/nextpnr.git"
EGIT_SUBMODULES=( 3rdparty/corrosion )

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="gui python openmp chipdb ipo ice40 ecp5 cyclonev nexus gowin himbaechel"

DEPEND="dev-qt/qtcore:5
		dev-libs/boost[python]
		dev-cpp/eigen
		dev-embedded/yosys
		ice40? ( dev-embedded/icestorm  )
		ecp5? ( dev-embedded/trellis )
		cyclonev? ( dev-embedded/mistral )
		nexus? ( dev-embedded/oxide )
		gowin? ( dev-embedded/apicula )
		himbaechel? ( dev-embedded/nextpnr-xilinx-meta )
		gui? ( dev-qt/qtbase )
		python? ( dev-lang/python )
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DEXTERNAL_CHIPDB="$(usex chipdb)"
		-DUSE_OPENMP="$(usex openmp)"
		-DBUILD_PYTHON="$(usex python)"
		-DBUILD_GUI="$(usex gui)"
		-DUSE_IPO="$(usex ipo)"
	)

	ARCHS="generic"
	if use ice40 ; then
		ARCHS+=";ice40"
	elif use ecp5 ; then
		ARCHS+=";ecp5"
	elif use nexus ; then
		ARCHS+=";nexus"
	elif use himbaechel ; then
		ARCHS+=";himbaechel"
	elif use gowin ; then
		mycmakeargs+=(-DHIMBAECHEL_GOWIN_DEVICES="all")
	fi

	mycmakeargs+=(-DARCH="${ARCHS}")

	cmake_src_configure
}
