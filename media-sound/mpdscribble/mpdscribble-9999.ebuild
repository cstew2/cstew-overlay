# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 meson ninja-utils

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="https://www.musicpd.org/clients/mpdscribble/"
EGIT_REPO_URI="https://github.com/MusicPlayerDaemon/mpdscribble.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+acct"

RDEPEND=">=media-libs/libmpdclient-2.5
	>=dev-libs/boost-1.62
	dev-libs/libgcrypt
	>=net-misc/curl-7.18
	acct? ( acct-user/mpdscribble )"
DEPEND="${RDEPEND}
	dev-util/ninja"

src_prepare() {
	default
}

src_configure() {
	meson_src_configure
}

src_compile() {
	eninja -C "${BUILD_DIR}"
}

src_install() {
	meson_src_install
	rm -r "${D}/usr/share/doc/mpdscribble"
	dodoc AUTHORS NEWS README.rst
	doman doc/mpdscribble.1
	newinitd "${FILESDIR}/mpdscribble.rc" mpdscribble
}
