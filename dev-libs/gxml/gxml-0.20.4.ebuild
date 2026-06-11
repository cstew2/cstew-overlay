# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vala

DESCRIPTION="GXml provides a GObject API for manipulating XML and a Serializable framework from GObject to XML."
HOMEPAGE="https://gitlab.gnome.org/GNOME/gxml"
SRC_URI="https://gitlab.gnome.org/GNOME/gxml/-/archive/0.20.4/gxml-0.20.4.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="$(vala_depend)
		 dev-libs/libgee"
DEPEND="${RDEPEND}"
BDEPEND=""

src_prepare() {
	vala_setup --ignore-use
	default
}
