# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 distutils-r1

DESCRIPTION="A JSON5 serializer and parser library for Python 3 written in Cython."
HOMEPAGE="https://github.com/Kijewski/pyjson5"
EGIT_REPO_URI="https://github.com/Kijewski/pyjson5.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/colorama
		dev-python/cython
		dev-python/more-itertools
		dev-python/sphinx
		dev-python/sphinx-autodoc-typehints
		dev-python/sphinx_rtd_theme
		dev-python/wheel
	   "
RDEPEND="${DEPEND}"
BDEPEND=""
