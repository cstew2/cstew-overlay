# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1 git-r3

DESCRIPTION="clikan is a super simple personal kanban board that runs in a CLI "
HOMEPAGE="https://github.com/kitplummer/clikan"
EGIT_REPO_URI="https://github.com/kitplummer/clikan.git"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""
RESTRICT=""

RDEPEND=""
DEPEND="
		dev-python/click
		dev-python/click-default-group
		dev-python/pyyaml
		dev-python/terminaltables
		"
