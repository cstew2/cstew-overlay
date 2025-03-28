# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1

DESCRIPTION="LEMS interpreter implemented in Python"
HOMEPAGE="https://github.com/LEMS/pylems"
SRC_URI="https://github.com/LEMS/pylems/archive/refs/tags/v${PV}.tar.gz"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
