# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="A low-level N64 video emulation plugin (based on angrylion RDP)"
HOMEPAGE="https://github.com/ata4/angrylion-rdp-plus"
EGIT_REPO_URI="https://github.com/ata4/angrylion-rdp-plus.git"

LICENSE="GPL-2 XMAME"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="games-emulation/mupen64plus-core
		media-libs/freeglut"
RDEPEND="${DEPEND}"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	MAKEARGS=(
		# this basically means: GNU userspace
		UNAME=Linux

		# verbose output
		V=1

		# paths, some of them are used at compile time
		PREFIX=/usr
		LIBDIR=/usr/$(get_libdir)

		# disable unwanted magic
		LDCONFIG=:
		INSTALL_STRIP_FLAG=
	)

	use amd64 && MAKEARGS+=( HOST_CPU=x86_64 )
	use x86 && MAKEARGS+=( HOST_CPU=i386 )

	cmake-utils_src_compile
}

src_install() {
	insinto /usr/lib64/mupen64plus
	doins "${WORKDIR}/${P}_build/mupen64plus-video-angrylion-plus.so"
	dodoc "README.md"
}
