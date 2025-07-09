# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="Beautiful spinners for terminal, IPython and Jupyter"
HOMEPAGE="https://github.com/manrajgrover/halo"
EGIT_REPO_URI="https://github.com/manrajgrover/halo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/six
		dev-python/colorama
		dev-python/termcolor
		dev-python/spinners
		dev-python/log-symbols"
RDEPEND="${DEPEND}"
BDEPEND=""
