# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION="Plugin for OpenRGB to create virtual devices out of multiple real ones"
HOMEPAGE="https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin"
EGIT_REPO_URI="https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin.git"

KEYWORDS="amd64"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	>=app-misc/openrgb-0.7:=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
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
	doexe libOpenRGBVisualMapPlugin.so.1.0.0
}
