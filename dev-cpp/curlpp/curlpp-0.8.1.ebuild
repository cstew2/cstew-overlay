# Copyright 2018-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ wrapper for libcURL"
HOMEPAGE="https://www.curlpp.org/"
SRC_URI="https://github.com/jpbarrette/curlpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc examples"

RDEPEND=">=net-misc/curl-7.58.0"
DEPEND=">=dev-util/cmake-3.9.6
	${RDEPEND}"

src_prepare() {
	cmake_src_prepare
	sed -i 's/@LDFLAGS@ //' extras/curlpp.pc.in || die
	sed -i 's,@includedir@,${prefix}/@includedir@,' extras/curlpp.pc.in || die
	sed -i 's,@libdir@,${prefix}/@libdir@,' extras/curlpp.pc.in || die
}

src_install() {
	cmake_src_install
	dodoc Readme.md doc/AUTHORS doc/TODO
	if use doc; then
		dodoc doc/guide.pdf
	fi
	if use examples; then
		dodoc -r examples/
	fi
}
