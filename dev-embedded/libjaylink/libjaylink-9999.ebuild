# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.zapb.de/libjaylink/libjaylink.git"

inherit git-r3 autotools eutils

DESCRIPTION="Library to access J-Link devices"
HOMEPAGE="https://gitlab.zapb.de/libjaylink/libjaylink"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="static-libs"

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf || die
	default
}

src_configure() {
	econf $(use_enable static-libs static)
}
