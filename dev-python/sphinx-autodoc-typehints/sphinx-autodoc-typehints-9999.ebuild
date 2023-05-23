# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})
DISTUTILS_USE_PEP517=hatchling

inherit git-r3 distutils-r1

DESCRIPTION="Type hints support for the Sphinx autodoc extension"
HOMEPAGE="https://github.com/agronholm/sphinx-autodoc-typehints"
EGIT_REPO_URI="https://github.com/agronholm/sphinx-autodoc-typehints.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/sphinx
		dev-python/wheel"
RDEPEND="${DEPEND}"
BDEPEND=""
