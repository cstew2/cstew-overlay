# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

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
