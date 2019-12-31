# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=(python3_{5,6,7})
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 cmake-utils

DESCRIPTION="Tensor Computation and Deep Neural Network python library"
HOMEPAGE="https://pytorch.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc cuda ffmpeg gflags glog lapack leveldb lmdb mkl mpi protobuf opencl opencv redis tbb test zmq"
RESTRICT="!test? ( test )"

RDEPEND="
		cuda? (
			 sci-libs/magma
			 dev-libs/cudnn
			 >=dev-util/nvidia-cuda-toolkit-9.0.176
		 )
		 ffmpeg? ( virtual/ffmpeg )
		 gflags? ( dev-cpp/gflags )
		 glog?   ( dev-cpp/glog )
		 leveldb? ( dev-libs/leveldb )
		 lmdb? ( dev-db/lmdb )
		 mkl? ( sci-libs/mkl )
		 !mkl? ( virtual/blas )
		 mpi? ( virtual/mpi )
		 opencl? ( virtual/opencl )
		 opencv? ( media-libs/opencv )
		 protobuf? ( dev-libs/protobuf )
		 redis? ( dev-db/redis )
		 tbb? ( dev-cpp/tbb )
		 zmq? ( net-libs/zeromq )
		 dev-util/cpuinfo-collection
		 dev-python/numpy
		 dev-python/pyyaml
		 dev-python/cffi
		 sys-process/numactl
		 doc? (
			 dev-python/sphinx
			 dev-python/sphinx_rtd_theme
		 )"
DEPEND="${RDEPEND}
		dev-util/ninja
		dev-python/setuptools
		test? ( dev-python/pytest )"

src_configure() {
	mycmakeargs+=(-DCMAKE_THREAD_PREFER_PTHREAD=TRUE
				  -DTHREADS_PREFER_PTHREAD_FLAG=TRUE
				  -DCMAKE_EXE_LINKER_FLAGS=-lpthread)
	cmake-utils_src_configure
	distutils-r1_src_configure
}

src_compile() {
	distutils-r1_python_compile
}

src_install() {
	cmake-utils_src_install
}
