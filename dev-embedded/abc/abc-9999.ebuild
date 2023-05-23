# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="ABC: System for Sequential Logic Synthesis and Formal Verification"
HOMEPAGE="https://github.com/YosysHQ/abc"
EGIT_REPO_URI="https://github.com/YosysHQ/abc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sys-libs/readline
	   "
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_install() {
	dobin "${S}/abc"
}
