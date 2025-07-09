# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 cmake

DESCRIPTION="NEST is a simulator for spiking neural network models"
HOMEPAGE="https://github.com/nest/nest-simulator"
SRC_URI="https://github.com/nest/nest-simulator/archive/refs/tags/v${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test +python"

DEPEND="sys-cluster/openmpi
		>=sci-libs/gsl-1.11
		>=dev-libs/boost-1.69
		mpi? ( virtual/mpi )
		test? ( dev-python/pytest
				dev-python/pytest-timeout
				dev-python/pytest-xdist
				dev-python/numpy
				dev-python/pandas
				dev-python/scipy
				dev-python/mpi4py
				dev-python/terminaltables
				dev-python/pycodestyle
				dev-util/cppcheck )
		docs? ( dev-python/PyYAML
				dev-python/sphinx
				dev-python/ipython )
		python? ( dev-python/numpy
				  dev-python/scipy )"
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest
				 dev-python/pytest-xdist )"

PATCHES=( "${FILESDIR}/python-lib.patch" )

S="${WORKDIR}/${PN}-simulator-${PV}"

src_configure() {
	sed -i '/  add_subdirectory( pynest )/d'

	default
	local mycmakeargs=(
		-Dwith-mpi="$(usex mpi ON OFF)"
		-Dwith-python="$(usex python ON OFF)"
	)
	cmake_src_configure

	pushd pynest
	cp setup.py.in setup.py
	distutils-r1_src_configure
	popd
}

src_compile() {
	cmake_src_compile
	pushd pynest
	distutils-r1_src_compile
	popd
}

src_install() {
	cmake_src_install
	pushd pynest
	distutils-r1_src_install
	popd
}
