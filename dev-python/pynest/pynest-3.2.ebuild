# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1 cmake

DESCRIPTION="NEST is a simulator for spiking neural network models"
HOMEPAGE="https://github.com/nest/nest-simulator"
SRC_URI="https://github.com/nest/nest-simulator/archive/refs/tags/v${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-cpp/nest"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/nest-simulator-${PV}"

src_prepare() {
	default
	cmake_src_prepare
	cd pynest
	distutils-r1_src_prepare
}

src_configure() {
	default
	cmake_src_configure
	cd pynest || die
	cp ../../nest-simulator-${PV}_build/pynest/setup.py ./ || die
	distutils-r1_src_configure
}

src_compile() {
	cmake_src_compile
	cd pynest
	distutils-r1_src_compile
	cythonize pynestkernel.pyx
}

src_install() {
	default
	cd pynest
	distutils-r1_src_install
}
