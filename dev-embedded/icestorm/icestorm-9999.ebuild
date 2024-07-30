# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit git-r3

DESCRIPTION="Lattice iCE40 FPGAs Bitstream Documentaion (Reverse Engineered)"
HOMEPAGE="https://github.com/YosysHQ/icestorm"
EGIT_REPO_URI="https://github.com/YosysHQ/icestorm.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}
