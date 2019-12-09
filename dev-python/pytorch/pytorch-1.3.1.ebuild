# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=(python3_{5,6,7})
PYTHON_REQ_USE="threads(+)"

FORTRAN_NEEDED=lapack

inherit distutils-r1 flag-o-matic fortran-2 multiprocessing toolchain-funcs

DESCRIPTION="Tensor Computation and Deep Neural Network python library"
HOMEPAGE="https://pytorch.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc cuda lapack mpi test"
RESTRICT="!test? ( test )"

RDEPEND="virtual/lapack
		 virtual/cblas
		 virtual/blas
		 mpi? (
			  virtual/mpi
		 )
		 dev-libs/protobuf
		 dev-libs/protobuf-c
		 dev-util/cpuinfo-collection
		 dev-python/numpy
		 dev-python/pyyaml
		 dev-python/setuptools
		 dev-python/cffi
		 cuda? (
			 sci-libs/magma
			 >=dev-util/nvidia-cuda-toolkit-9.0.176
		 )
		 doc? (
			 dev-python/sphinx
			 dev-python/sphinx_rtd_theme
		 )"
DEPEND="${RDEPEND}"
BDEPEND=""

src_unpack() {
	default
}

python_compile() {
	default
}

python_test() {
	default
}

python_install() {
	default
}

python_install_all() {
	#if use doc; then
		#something
	#fi

	distutils-r1_python_install_all
}
