# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="ABC: System for Sequential Logic Synthesis and Formal Verification"
HOMEPAGE="https://github.com/YosysHQ/abc"
EGIT_REPO_URI="https://github.com/YosysHQ/abc.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/readline
	   "
RDEPEND="${DEPEND}"
BDEPEND="dev-util/pkgconfig"

src_install() {
	dobin ${S}/abc
}
