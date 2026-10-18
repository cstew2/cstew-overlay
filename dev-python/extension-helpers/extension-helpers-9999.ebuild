# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Helpers with building Python with compiled C/Cython extensions"
HOMEPAGE="https://github.com/astropy/extension-helpers/"
EGIT_REPO_URI="https://github.com/astropy/extension-helpers.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/tomli
		"
RDEPEND="${DEPEND}"
BDEPEND=""
