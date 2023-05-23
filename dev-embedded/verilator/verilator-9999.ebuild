# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit git-r3 autotools

DESCRIPTION="Open Source Verilog and SystemC Software - Serious Tools for Real Projects"
HOMEPAGE="https://www.veripool.org/"
EGIT_REPO_URI="https://github.com/verilator/verilator.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/perl
		dev-util/google-perftools
		sys-process/numactl
		"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/flex
		 sys-devel/bison
		 "

src_prepare() {
	default
	eautoconf
}

src_configure() {
	econf
}

src_compile() {
	default
}

src_install() {
	default
}
