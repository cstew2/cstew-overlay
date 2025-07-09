# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake

DESCRIPTION="NEST is a simulator for spiking neural network models"
HOMEPAGE="https://github.com/nest/nest-simulator"
EGIT_REPO_URI="https://github.com/nest/nest-simulator.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="docs test +python mpi"

DEPEND=">=sci-libs/gsl-1.11
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
		python?	( dev-python/numpy
				  dev-python/scipy )"
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest
				 dev-python/pytest-xdist )"

S="${WORKDIR}/${PN}-${PV}"

src_configure() {
	default

	sed -i 's/\${PYEXECDIR}/lib/' "${S}/pynest/CMakeLists.txt"

	local mycmakeargs=(
		-Dwith-mpi="$(usex mpi ON OFF)"
		-Dwith-python="$(usex python ON OFF)"
	)

	cmake_src_configure
}
