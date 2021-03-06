# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig

DESCRIPTION="river is a dynamic tiling wayland compositor inspired by dwm and bspwm."
HOMEPAGE="https://github.com/ifreund/river"
EGIT_REPO_URI="https://github.com/ifreund/river.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RDEPEND="gui-libs/wlroots
	 dev-libs/wayland-protocols
	 ~dev-lang/zig-9999
	 x11-libs/libxkbcommon
	 dev-libs/libevdev
	 x11-libs/pixman
	"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( app-text/scdoc )
	   "

src_compile() {
	zig build -Drelease-safe=true
}

src_install() {
	dobin zig-cache/bin/river
	dobin zig-cache/bin/riverctl
	dobin zig-cache/bin/rivertile
}
