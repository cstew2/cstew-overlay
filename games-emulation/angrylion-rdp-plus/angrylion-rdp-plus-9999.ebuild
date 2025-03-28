# Copyright 1999-2024 Gentoo Authors
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
