# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=(python3_{13,14})

inherit distutils-r1 git-r3

DESCRIPTION="Python port of the fzy fuzzy string matching algorithm."
HOMEPAGE="https://github.com/kazhala/pfzy"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/kazhala/pfzy.git"

KEYWORDS=""
SLOT="0"

RDEPEND="
	dev-python/furo
	dev-python/myst-parser
	dev-python/sphinx
	dev-python/sphinx-copybutton
"
DEPEND="${RDEPEND}"
BDEPEND=""
