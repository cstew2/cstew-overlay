# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 distutils-r1

DESCRIPTION="Parses JUnit/xUnit Result XML files with ease"
HOMEPAGE="https://github.com/kyrus/python-junit-xml"
EGIT_REPO_URI="https://github.com/kyrus/python-junit-xml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-python/six"
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/flake8
				dev-python/pytest-sugar
				dev-python/pytest-flake8 )
		"
