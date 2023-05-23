# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/m-labs/nmigen"
EGIT_REPO_URI="https://github.com/m-labs/nmigen.git"
EGIT_COMMIT="v0.1"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/pyvcd
		dev-python/jinja
	   "
RDEPEND="${DEPEND}"
BDEPEND=""
