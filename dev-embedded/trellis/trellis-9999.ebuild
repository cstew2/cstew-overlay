# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake

DESCRIPTION="Documenting the Lattice ECP5 bit-stream format."
HOMEPAGE="https://github.com/YosysHQ/prjtrellis"
EGIT_REPO_URI="https://github.com/YosysHQ/prjtrellis.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-embedded/openocd
		dev-libs/boost[python]
		"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}/libtrellis"
