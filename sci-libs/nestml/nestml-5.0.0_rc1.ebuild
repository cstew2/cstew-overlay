# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1

DESCRIPTION="A domain specific language to describe neuron models in NEST"
HOMEPAGE="https://github.com/nest/nestml"
SRC_URI="https://github.com/nest/nestml/archive/refs/tags/v5.0.0-rc1.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/numpy
		dev-python/sympy
		dev-python/antlr4-python3-runtime
		>=dev-python/jinja-2.10
		dev-python/astropy
		dev-python/odetoolbox"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-5.0.0-rc1"

python_prepare() {
	sed -i -e "s/find_packages()/find_packages(exclude=['tests'])/" setup.py || die
	sed -i -e "s/data_files=data_files,//" setup.py || die
	default
}

src_install() {
	default
	distutils-r1_src_install
	dodoc -r doc
	insinto /usr/share/${PF}/
	doins -r models
	doins -r extras
}
