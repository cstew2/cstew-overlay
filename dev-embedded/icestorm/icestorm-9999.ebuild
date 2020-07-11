# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3

DESCRIPTION="Project IceStorm - Lattice iCE40 FPGAs Bitstream Documentaion (Reverse Engineered)"
HOMEPAGE="https://github.com/YosysHQ/icestorm"
EGIT_REPO_URI="https://github.com/YosysHQ/icestorm.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}
