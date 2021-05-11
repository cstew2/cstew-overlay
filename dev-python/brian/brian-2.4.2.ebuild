# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_7,3_8,3_9})

inherit distutils-r1

DESCRIPTION="Brian 2 frontend to the GeNN simulator"
HOMEPAGE="https://github.com/brian-team/brian2genn"
SRC_URI="https://github.com/brian-team/brian2/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/numpy
		dev-python/sympy
		dev-python/pyparsing
		dev-python/jinja
		test? ( dev-python/pytest
				dev-python/pytest-xdist )
		docs? ( dev-python/sphinx
				dev-python/ipython )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}2-${PV}"
