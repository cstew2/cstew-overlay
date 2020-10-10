# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_6,3_7,3_8})

inherit git-r3

DESCRIPTION="SymbiYosys (sby) -- Front-end for Yosys-based formal verification flows"
HOMEPAGE="https://github.com/YosysHQ/SymbiYosys"
EGIT_REPO_URI="https://github.com/YosysHQ/SymbiYosys.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-embedded/yosys
	   "
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
	:;
}

src_install() {
	emake install PREFIX=/usr DESTDIR="${D}"
}
