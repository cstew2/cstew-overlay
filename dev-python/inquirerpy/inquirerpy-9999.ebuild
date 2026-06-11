# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=(python3_{13,14})

inherit python-r1 git-r3

DESCRIPTION="Python port of Inquirer.js (A collection of common interactive command-line user interfaces)"
HOMEPAGE="https://github.com/kazhala/InquirerPy"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/kazhala/InquirerPy.git"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="docs"
RDEPEND="dev-python/prompt-toolkit[${PYTHON_USEDEP}]
		 dev-python/pfzy[${PYTHON_USEDEP}]
		 docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
		 docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
		 docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
		 docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}"
BDEPEND=""
