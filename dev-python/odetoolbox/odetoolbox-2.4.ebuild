# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit distutils-r1

DESCRIPTION="selection and generation of integration schemes for systems of ordinary differential equations"
HOMEPAGE="https://github.com/nest/ode-toolbox"
SRC_URI="https://github.com/nest/ode-toolbox/archive/refs/tags/v2.4.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND=">=dev-python/numpy-1.8.2
		dev-python/sympy
		dev-python/scipy
		dev-python/cython
		dev-python/matplotlib
		test? ( dev-python/pytest
				dev-python/graphviz )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/ode-toolbox-2.4"

python_prepare_all() {
	sed -i -e '/pytest-runner/d' setup.py || die
	distutils-r1_python_prepare_all
}
