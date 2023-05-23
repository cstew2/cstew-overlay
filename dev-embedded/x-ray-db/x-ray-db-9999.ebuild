# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Project X-Ray Database: XC7 Series"
HOMEPAGE="https://github.com/SymbiFlow/prjxray-db"
EGIT_REPO_URI="https://github.com/SymbiFlow/prjxray-db.git"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:;
}

src_install() {
	dodoc README.md
	mkdir -p "${D}/usr/share/x-ray/database/"
	cp -r "${S}/artix7" "${D}/usr/share/x-ray/database/"
	cp -r "${S}/kintex7" "${D}/usr/share/x-ray/database/"
	cp -r "${S}/zynq7" "${D}/usr/share/x-ray/database/"
}
