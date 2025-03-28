# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 distutils-r1

DESCRIPTION="MILC is a framework for writing CLI applications in Python 3.6+"
HOMEPAGE="https://milc.clueboard.co/"
EGIT_REPO_URI="https://github.com/clueboard/milc.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/argcomplete
		dev-python/halo"
RDEPEND="${DEPEND}"
BDEPEND=""
