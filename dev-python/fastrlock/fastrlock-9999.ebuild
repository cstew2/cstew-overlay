# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})

inherit git-r3 distutils-r1

DESCRIPTION="A fast RLock implementation for CPython"
HOMEPAGE="https://github.com/scoder/fastrlock"
EGIT_REPO_URI="https://github.com/scoder/fastrlock.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
