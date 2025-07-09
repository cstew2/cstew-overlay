# Copyright 1999-2025 Gentoo Authors
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
IUSE="gui python openmp chipdb ipo ice40 ecp5 cyclonev nexus gowin himbaechel xilinx ngultra"

DEPEND="dev-libs/boost[python]
		dev-cpp/eigen
		dev-embedded/yosys
		ice40? ( dev-embedded/icestorm  )
		ecp5? ( dev-embedded/trellis )
		cyclonev? ( dev-embedded/mistral )
		nexus? ( dev-embedded/oxide )
		gowin? ( dev-embedded/apicula )
		himbaechel? ( dev-embedded/nextpnr-xilinx-meta )
		gui? ( dev-qt/qtbase
			   dev-qt/qtcore:5
			   dev-qt/qtopengl:5 )
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

	sed -i '/add_subdirectory(tests\/gui)/d' "${S}/CMakeLists.txt"

	UARCHS="example"

	ARCHS="generic"
	if use ice40 ; then
		ARCHS+=";ice40"
		mycmakeargs+=( -DICESTORM_INSTALL_PREFIX="/usr/share/" )
	elif use ecp5 ; then
		ARCHS+=";ecp5"
		mycmakeargs+=( -DTRELLIS_INSTALL_PREFIX="/usr/share/" )
	elif use nexus ; then
		ARCHS+=";nexus"
		mycmakeargs+=( -DOXIDE_INSTALL_PREFIX="/usr/share/" )
	elif use himbaechel ; then
		ARCHS+=";himbaechel"
		if use xilinx ; then
			UARCHS+=";xilinx"
			mycmakeargs+=( -DHIMBAECHEL_PRJXRAY_DB="/usr/share/" )
			#mycmakeargs+=( -DHIMBAECHEL_XILINX_DEVICES="xc7a100t" ) #pypy3 required
		elif use gowin ; then
			UARCHS+=";gowin"
		elif use ngultra ; then
			UARCHS+=";ng-ultra"
			mycmakeargs+=( -DHIMBAECHEL_PRJBEYOND_DB="/usr/share/" )
		fi
	fi

	mycmakeargs+=( -DARCH="${ARCHS}"
				   -DHIMBAECHEL_UARCH="${UARCHS}")

	cmake_src_configure
}
