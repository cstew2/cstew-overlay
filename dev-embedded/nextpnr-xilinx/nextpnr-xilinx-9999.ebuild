# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{9,10})

inherit git-r3 cmake python-r1

DESCRIPTION="Experimental place-and-route tool for Xilinx devices"
HOMEPAGE="https://github.com/gatecat/nextpnr-xilinx"
EGIT_REPO_URI="https://github.com/gatecat/nextpnr-xilinx.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

DEPEND="dev-cpp/eigen
		dev-embedded/yosys
		dev-embedded/x-ray
		dev-embedded/x-ray-db
		dev-libs/boost[python]
		dev-qt/qtcore:5
		"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/new_layout.patch"
		  "${FILESDIR}/new_eigen.patch"
		  "${FILESDIR}/include_set.patch" )

src_configure() {
	local mycmakeargs=(
		-DARCH=xilinx
		-DEIGEN3_INCLUDE_DIRS=/usr/include/eigen3
	)

	cmake_src_configure
}

src_compile() {
	default
	cmake_src_compile

	python3 "${S}/xilinx/python/bbaexport.py" \
			--xray /usr/share/x-ray/database/artix7 \
			--metadata /usr/share/x-ray/metadata/artix7 \
			--device xc7a100tfgg676-2\
			--bba "${S}/xilinx/xc7a100t.bba" || die

	"${WORKDIR}"/"${P}_build"/bbasm --le -v --files "${S}/xilinx/xc7a100t.bba" "${S}/xilinx/xc7a100t.bin" || die
}

src_install() {
	cmake_src_install
	dobin "${WORKDIR}/${P}_build"/bbasm

	mkdir -p "${D}/usr/share/x-ray/chipdb/artix7/"
	cp "${S}/xilinx/xc7a100t.bba" "${D}/usr/share/x-ray/chipdb/artix7/"
	cp "${S}/xilinx/xc7a100t.bin" "${D}/usr/share/x-ray/chipdb/artix7/"
}
