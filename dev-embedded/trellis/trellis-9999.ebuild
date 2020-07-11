# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 cmake

DESCRIPTION="Documenting the Lattice ECP5 bit-stream format."
HOMEPAGE="https://github.com/YosysHQ/prjtrellis"
EGIT_REPO_URI="https://github.com/YosysHQ/prjtrellis.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-util/cmake-3.5
		dev-embedded/OpenOCD
		dev-libs/boost[python]
		"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}/libtrellis"
