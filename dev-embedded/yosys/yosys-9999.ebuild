# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_6,3_7,3_8})

inherit git-r3

DESCRIPTION="yosys – Yosys Open SYnthesis Suite. This is a framework for RTL synthesis tools."
HOMEPAGE="http://www.clifford.at/yosys/"
EGIT_REPO_URI="https://github.com/YosysHQ/${PN}.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/bison
		sys-devel/flex
		sys-libs/readline
		sys-apps/gawk
		dev-libs/libffi
		media-gfx/graphviz
		>=dev-lang/python-3.6
		dev-libs/boost[python,zlib]
		sys-libs/zlib
		dev-lang/tcl
		dev-util/gperf
		dev-embedded/abc
		"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/pkgconfig"

src_compile() {
	emake ABCEXTERNAL=/usr/bin/abc all
}

src_install() {
	dobin yosys
	dobin yosys-config
	dobin yosys-filterlib
	dobin yosys-smtbmc
}
