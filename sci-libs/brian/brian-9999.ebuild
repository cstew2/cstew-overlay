# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_EXT=1

inherit distutils-r1 git-r3

DESCRIPTION="Brian is a free, open source simulator for spiking neural networks"
HOMEPAGE="https://github.com/brian-team/brian2"
EGIT_REPO_URI="https://github.com/brian-team/brian2.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="docs test"

DEPEND="dev-python/numpy
		dev-python/sympy
		dev-python/pyparsing
		dev-python/jinja
		docs? ( dev-python/sphinx
				dev-python/ipython )
		dev-python/versioneer
	   "
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest
				 dev-python/pytest-xdist )"

S="${WORKDIR}/${PN}-${PV}"
