# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 git-r3

DESCRIPTION="Tools to use with Brian 2, in particular for visualization"
HOMEPAGE="https://github.com/brian-team/brian2tools"
EGIT_REPO_URI="https://github.com/brian-team/brian2tools.git"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/brian
		dev-python/matplotlib"
RDEPEND="${DEPEND}"
BDEPEND=""
