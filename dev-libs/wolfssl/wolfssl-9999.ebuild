# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 autotools

DESCRIPTION="Embedded SSL library."
HOMEPAGE="https://www.wolfssl.com/ https://github.com/wolfSSL/wolfssl"
EGIT_REPO_URI="https://github.com/wolfSSL/wolfssl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="debug cpu_flags_x86_aes sniffer"

DEPEND="sniffer? ( net-libs/libpcap )"
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		$(use_enable cpu_flags_x86_aes aesni) \
		$(use_enable sniffer) \
		$(use_enable debug) \
		--enable-distro \
		--enable-writedup # Needed for RPCS3
}
