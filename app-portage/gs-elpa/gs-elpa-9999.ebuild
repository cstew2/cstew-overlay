# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 distutils-r1

DESCRIPTION="A g-sorcery backend for elisp packages"
HOMEPAGE="https://github.com/houseofsuns/gs-elpa"
EGIT_REPO_URI="https://github.com/houseofsuns/gs-elpa.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-portage/g-sorcery
		 dev-python/sexpdata"
DEPEND="${RDEPEND}"
BDEPEND=""
