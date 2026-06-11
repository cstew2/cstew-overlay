# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})

inherit git-r3 python-single-r1 cmake

DESCRIPTION="NEST is a simulator for spiking neural network models"
HOMEPAGE="https://github.com/nest/nest-simulator"
EGIT_REPO_URI="https://github.com/nest/nest-simulator.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="docs +python test mpi openmp examples hdf5"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="sci-libs/gsl
		dev-libs/boost
		python? ( dev-python/numpy
				dev-python/scipy
				dev-python/matplotlib )
		mpi? ( virtual/mpi
			   dev-python/mpi4py )
		hdf5? ( sci-libs/hdf5 )
		test? ( dev-python/pytest
				dev-python/pytest-cov
				dev-python/pytest-xdist
				dev-python/flake8
				dev-python/pandas
				dev-python/scipy
				dev-python/mypy
				dev-python/black
				dev-python/isort )
		docs? ( dev-python/PyYAML
				dev-python/sphinx
				dev-python/ipython
				dev-python/csvkit
				dev-python/tdqm )
		examples? ( dev-python/networkx
					dev-python/seaborn
					dev-python/ipython
					dev-python/imageio
					dev-python/cycler )"
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest
				 dev-python/pytest-xdist )"

S="${WORKDIR}/${PN}-${PV}"

PATCHES=( "${FILESDIR}"/python-lib.patch )

src_configure() {
	local site_dir=$(python_get_sitedir)

	local mycmakeargs=(
		-DPython_EXECUTABLE="${PYTHON}"
		-DPYEXECDIR="${site_dir#${EPREFIX}/usr/}"
		-Dwith-python="$(usex python ON OFF)"
		-Dwith-mpi="$(usex mpi ON OFF)"
		-Dwith-openmp="$(usex openmp ON OFF)"
		-Dwith-hdf5="$(usex hdf5 ON OFF)"
		-Dwith-gsl=ON
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	python_optimize
}
