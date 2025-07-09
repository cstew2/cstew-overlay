# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION=" Colored symbols for various log levels for Python"
HOMEPAGE="https://github.com/manrajgrover/py-log-symbols"
EGIT_REPO_URI="https://github.com/manrajgrover/py-log-symbols.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/colorama"
RDEPEND="${DEPEND}"
BDEPEND=""
