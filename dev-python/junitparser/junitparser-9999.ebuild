# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 python-r1

DESCRIPTION="Parses JUnit/xUnit Result XML files with ease"
HOMEPAGE="https://github.com/gastlygem/junitparser"
EGIT_REPO_URI="https://github.com/gastlygem/junitparser.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
