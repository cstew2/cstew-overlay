# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Metadata for the nextpnr-xilinx xc7 flow "
HOMEPAGE="https://github.com/gatecat/nextpnr-xilinx-meta"
EGIT_REPO_URI="https://github.com/gatecat/nextpnr-xilinx-meta.git"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-embedded/nextpnr-xilinx"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:;
}

src_install() {
	dodoc README.md
	mkdir -p "${D}/usr/share/x-ray/metadata/"
	cp -r "${S}/artix7" "${D}/usr/share/x-ray/metadata/"
	cp -r "${S}/kintex7" "${D}/usr/share/x-ray/metadata/"
	cp -r "${S}/zynq7" "${D}/usr/share/x-ray/metadata/"
}
