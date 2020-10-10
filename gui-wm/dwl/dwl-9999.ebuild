# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig

DESCRIPTION="dwl is a compact, hackable compositor for Wayland based on wlroots."
HOMEPAGE="https://github.com/djpohly/dwl"
EGIT_REPO_URI="https://github.com/djpohly/dwl.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="gui-libs/wlroots
		 dev-libs/wayland-protocols
		"
DEPEND="${RDEPEND}
	   "

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	default
	save_config config.h
}
