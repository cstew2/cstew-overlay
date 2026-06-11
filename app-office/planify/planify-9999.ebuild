# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 vala meson

DESCRIPTION="Task manager"
HOMEPAGE="https://useplanify.com/"
EGIT_REPO_URI="https://github.com/alainm23/planify.git"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man xdg spell evolution"

RDEPEND="$(vala_depend)
		 x11-libs/libnotify
		 dev-libs/glib
		 dev-libs/libgee
		 net-libs/libsoup
		 dev-db/sqlite
		 gui-libs/libadwaita
		 dev-libs/json-glib
		 dev-libs/libical[vala]
		 dev-libs/gxml
		 app-crypt/libsecret
		 gui-libs/gtksourceview[vala]
		 dev-libs/icu
		 xdg? ( sys-apps/xdg-desktop-portal )
		 spell? ( app-text/libspelling )
		 evolution? ( mail-client/evolution )"
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
	vala_setup --ignore-use
	default
}

src_configure() {
		local emesonargs=(
			$(meson_use man manpage)
			$(meson_use evolution)
			$(meson_feature spell spelling)
			$(meson_use xdg portal)
		)
		meson_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
