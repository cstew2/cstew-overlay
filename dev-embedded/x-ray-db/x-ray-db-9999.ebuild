# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3

DESCRIPTION=" Project X-Ray Database: XC7 Series "
HOMEPAGE="https://github.com/SymbiFlow/prjxray-db"
EGIT_REPO_URI="https://github.com/SymbiFlow/prjxray-db.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-embedded/x-ray
	   "
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:;
}

src_install() {
	dodoc README.md
	mkdir -p ${D}/usr/share/x-ray/database/
	cp -r ${S}/artix7 ${D}/usr/share/x-ray/database/
	cp -r ${S}/kintex7 ${D}/usr/share/x-ray/database/
	cp -r ${S}/zynq7 ${D}/usr/share/x-ray/database/
}
