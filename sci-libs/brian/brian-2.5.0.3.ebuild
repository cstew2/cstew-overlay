# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit distutils-r1

DESCRIPTION="Brian is a free, open source simulator for spiking neural networks."
HOMEPAGE="https://github.com/brian-team/brian2"
SRC_URI="https://github.com/brian-team/brian2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/numpy
		dev-python/sympy
		dev-python/pyparsing
		dev-python/jinja
		docs? ( dev-python/sphinx
				dev-python/ipython )
	   "
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest
				 dev-python/pytest-xdist )"

S="${WORKDIR}/${PN}2-${PV}"
