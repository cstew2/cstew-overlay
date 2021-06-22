# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1 prefix git-r3

DESCRIPTION="framework for ebuild generators"
HOMEPAGE="https://github.com/jauhien/g-sorcery"
EGIT_REPO_URI="https://github.com/jauhien/g-sorcery.git"

LICENSE="GPL-2"
SLOT="0"
IUSE="bson git test"
RESTRICT="!test? ( test )"
KEYWORDS="~amd64"

DEPEND="bson? ( dev-python/pymongo[${PYTHON_USEDEP}] )
	git? ( dev-vcs/git )
	sys-apps/portage[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
PDEPEND=">=app-portage/layman-2.2.0[g-sorcery(-),${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}/default_eapi.patch"
	"${FILESDIR}/fix_stack_trace_without_overlay_arg.patch"
	"${FILESDIR}/fix_prefix.patch"
	"${FILESDIR}/python_37_38.patch"
)

src_prepare() {
	hprefixify setup.py
	default
}

python_test() {
	PYTHONPATH="." "${PYTHON}" scripts/run_tests.py
}

python_install_all() {
	distutils-r1_python_install_all

	doman docs/*.8
	diropts -m0777
	dodir /var/lib/g-sorcery
}
