# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools eutils

DESCRIPTION="Library to access J-Link devices"
HOMEPAGE="https://gitlab.zapb.de/libjaylink/libjaylink"

SRC_URI="https://gitlab.zapb.de/libjaylink/libjaylink/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf || die
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	prune_libtool_files
}