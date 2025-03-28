# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake distutils-r1

DESCRIPTION="NEURON is a simulation environment for modeling individual neurons and networks of neurons"
HOMEPAGE="https://neuron.yale.edu/neuron/"
EGIT_REPO_URI="https://github.com/neuronsimulator/nrn.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test mpi +python gui +threads +simd +rx3d music backtrace"

DEPEND="python? ( dev-python/mpi4py
				  dev-python/scipy
				  dev-python/numpy
				  dev-python/scikit-build
				  dev-python/cython )
		sci-libs/nmodl
		sys-devel/bison
		sys-devel/flex
		mpi? ( virtual/mpi )"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	default
	local mycmakeargs=(
		-DNRN_ENABLE_INTERVIEWS="$(usex gui ON OFF)"
		-DNRN_ENABLE_MPI="$(usex mpi ON OFF)"
		-DNRN_ENABLE_PYTHON="$(usex python ON OFF)"
		-DNRN_ENABLE_THREADS="$(usex threads ON OFF)"
		-DNRN_ENABLE_MUSIC="$(usex music ON OFF)"
		-DNRN_ENABLE_CORENEURON=ON
		-DNRN_ENABLE_BACKTRACE="$(usex backtrace ON OFF)"
		-DNRN_ENABLE_TESTS="$(usex test ON OFF)"
		-DNRN_ENABLE_MATH_OPT="$(usex simd ON OFF)"
		-DNRN_ENABLE_RX3D="$(usex rx3d ON OFF)"
	)

	cmake_src_configure

	if use python ; then
		distutils-r1_src_configure
	fi
}

src_compile() {
	default
	cmake_src_compile

	if use python ; then
		distutils-r1_src_compile
	fi

}

src_install() {
	default
	cmake_src_install

	if use python ; then
		distutils-r1_src_install
	fi
}
