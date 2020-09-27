# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Exemplary MSP communications simulator using a normalized VU."
HOMEPAGE="https://github.com/mupen64plus/mupen64plus-rsp-cxd4"
EGIT_REPO_URI="https://github.com/mupen64plus/mupen64plus-rsp-cxd4.git"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="games-emulation/mupen64plus-core"
RDEPEND="${DEPEND}"

src_compile() {
	emake -C projects/unix all
}

src_install() {
	insinto /usr/lib64/mupen64plus
	doins "${WORKDIR}/${P}/projects/unix/mupen64plus-rsp-cxd4-sse2.so"
	dodoc "README.md"
}
