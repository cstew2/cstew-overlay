# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig git-r3

DESCRIPTION="dwm for Wayland"
HOMEPAGE="https://git.sr.ht/~raphi/dwl"
EGIT_REPO_URI="https://git.sr.ht/~raphi/dwl"

LICENSE="CC0-1.0 GPL-3 MIT"
SLOT="0"
KEYWORDS=""
IUSE="X"

DOCS=( LICENSE LICENSE.{dwm,sway,tinywl} README.md )

RDEPEND="
	dev-libs/libinput
	dev-libs/wayland
	x11-libs/libxcb
	x11-libs/libxkbcommon
	gui-libs/wlroots:0/15[X(-)?]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
"

PATCHES=()

src_prepare() {
	restore_config config.h

	default
}

src_configure() {
	sed -i "s/\/local//" config.mk || die

	if use X; then
		sed -i \
			-e "s/^#XWAYLAND/XWAYLAND/" \
			-e "s/^#XLIBS/XLIBS/" \
			config.mk || die
	fi
}

src_install() {
	default

	insinto /usr/share/wayland-sessions
	doins "${FILESDIR}"/dwl.desktop

	save_config config.h
}
