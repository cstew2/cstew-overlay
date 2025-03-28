# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 distutils-r1

DESCRIPTION=" Dictionary wrapper for quick access to deeply nested keys."
HOMEPAGE="https://dotty-dict.readthedocs.io/en/latest/"
EGIT_REPO_URI="https://github.com/pawelzny/dotty_dict.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
