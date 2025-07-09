# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson ninja-utils

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="https://www.musicpd.org/clients/mpdscribble/"
SRC_URI="https://www.musicpd.org/download/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND=">=media-libs/libmpdclient-2.5
	>=dev-libs/boost-1.62
	dev-libs/libgcrypt
	>=net-misc/curl-7.18"
DEPEND="${RDEPEND}"

src_install() {
	default
	meson_src_install
	rm -r "${D}/usr/share/doc/mpdscribble"
	dodoc AUTHORS NEWS README.rst
	doman doc/mpdscribble.1
	newinitd "${FILESDIR}/mpdscribble.rc" mpdscribble
}
