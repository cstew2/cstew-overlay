# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="Compare two similar json files."
HOMEPAGE="https://github.com/leeyoshinari/Small_Tool/tree/master/pyjson"
EGIT_REPO_URI="https://github.com/leeyoshinari/Small_Tool.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	cd "${S}/pyjson"
	default
}

src_install() {
	cd "${S}/pyjson"
	default
}
