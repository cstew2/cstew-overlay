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

DEPEND="=dev-cpp/nest-${PV}
		dev-python/cython
		dev-python/numpy
		dev-python/scipy"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/cythonize.patch" )

S="${WORKDIR}/nest-simulator-${PV}"

src_prepare() {
	cmake_src_prepare
	#distutils-r1_src_prepare
	cd pynest
	cp setup.py.in setup.py
}

src_configure() {
	cmake_src_configure
	cd pynest
	distutils-r1_src_configure
}

src_compile() {
	cp "${WORKDIR}/nest-simulator-${PV}_build/libnestutil/config.h" "${S}/libnestutil/config.h"
	cd pynest
	distutils-r1_src_compile
}

src_install() {
	default
	distutils-r1_src_install
	dosym "${get_libdir}/nest/libmodels.so" "${python_get_sitedir}/nest/libmodels.so"
	dosym "${get_libdir}/nest/libmodels.so" "${python_get_sitedir}/nest/libmodels.so"
	dosym "${get_libdir}/nest/libnest.so" "${python_get_sitedir}/nest/libnest.so"
	dosym "${get_libdir}/nest/libsli_readline.so" "${python_get_sitedir}/nest/libsli_readline.so"
	dosym "${get_libdir}/nest/libnestkernel.so" "${python_get_sitedir}/nest/libnestkernel.so"
	dosym "${get_libdir}/nest/libnestutil.so" "${python_get_sitedir}/nest/libnestutil.so"
	dosym "${get_libdir}/nest/libsli.so" "${python_get_sitedir}/nest/libsli.so"
}
