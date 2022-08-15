# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION="Plugin for OpenRGB with various Effects that can be synced across devices"
HOMEPAGE="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin"
EGIT_REPO_URI="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git"

KEYWORDS="amd64"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	>=app-misc/openrgb-0.7:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5[-gles2-only]
	dev-qt/qtwidgets:5[-gles2-only]
	media-libs/openal
"
DEPEND="
	${RDEPEND}
	dev-cpp/nlohmann_json
"

src_configure() {
	eqmake5 \
		INCLUDEPATH+="${ESYSROOT}/usr/include/nlohmann"
}

src_install() {
	exeinto /usr/$(get_libdir)/OpenRGB/plugins
	doexe libOpenRGBEffectsPlugin.so.1.0
}
