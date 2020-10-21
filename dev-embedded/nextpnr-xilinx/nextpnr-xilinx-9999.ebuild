# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 cmake python-r1

DESCRIPTION="Experimental place-and-route tool for Xilinx devices"
HOMEPAGE="https://github.com/daveshah1/nextpnr-xilinx"
EGIT_REPO_URI="https://github.com/daveshah1/nextpnr-xilinx.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtcore:5
		dev-libs/boost[python]
		dev-cpp/eigen
		dev-embedded/yosys
		dev-embedded/x-ray
		dev-embedded/x-ray-db
		"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/cmake"

src_configure() {
	local mycmakeargs=(
		-DARCH=xilinx
	)

	cmake_src_configure
}

src_compile() {
	default
	cmake_src_compile

	python3 "${S}/xilinx/python/bbaexport.py" \
	--xray /usr/share/x-ray/database/artix7 \
	--device xc7a100tfgg676-1 \
	--bba "${S}/xilinx/xc7a100t.bba"

	"${WORKDIR}/${P}_build"/bbasm --le -v --files "${S}/xilinx/xc7a100t.bba" "${S}/xilinx/xc7a100t.bin"
}

src_install() {
	cmake_src_install
	dobin "${WORKDIR}/${P}_build"/bbasm

	mkdir -p "${D}/usr/share/x-ray/chipdb/artix7/"
	cp "${S}/xilinx/xc7a100t.bba" "${D}/usr/share/x-ray/chipdb/artix7/"
	cp "${S}/xilinx/xc7a100t.bin" "${D}/usr/share/x-ray/chipdb/artix7/"
}
