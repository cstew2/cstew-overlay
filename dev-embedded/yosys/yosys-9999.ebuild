# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{8,9,10})

inherit git-r3

DESCRIPTION="yosys - Yosys Open SYnthesis Suite. This is a framework for RTL synthesis tools."
HOMEPAGE="https://www.clifford.at/yosys/"
EGIT_REPO_URI="https://github.com/YosysHQ/${PN}.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-libs/readline
		sys-apps/gawk
		dev-libs/libffi
		media-gfx/graphviz
		dev-libs/boost[python,zlib]
		sys-libs/zlib
		dev-lang/tcl
		dev-embedded/abc
		media-gfx/xdot
		"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		 dev-util/gperf
		 sys-devel/bison
		 sys-devel/flex
		"

src_compile() {
	emake ABCEXTERNAL=/usr/bin/abc all
}

src_install() {
	emake ABCEXTERNAL=/usr/bin/abc DESTDIR="${D}" PREFIX=/usr install
}
