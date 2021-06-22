# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{8,9} )

inherit git-r3 distutils-r1

MY_PN=textX
MY_P=${MY_PN}-${PV}
DESCRIPTION="Meta-language for DSL implementation inspired by Xtext"
HOMEPAGE="https://github.com/textX/textX"
EGIT_REPO_URI="https://github.com/textX/textX.git"

RESTRICT="test"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/arpeggio[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]
		test? (
			  dev-python/pytest[${PYTHON_USEDEP}]
		)
		"

python_test() {
	py.test -v tests/functional || die "tests failed"
}
