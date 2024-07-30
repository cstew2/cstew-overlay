# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
PYTHON_COMPAT=(python3_{11,12})

inherit git-r3 cmake distutils-r1 cuda

DESCRIPTION="A library for efficient similarity search and clustering of dense vectors."
HOMEPAGE="faiss.ai "
EGIT_REPO_URI="https://github.com/facebookresearch/faiss.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docs cuda +python test"

DEPEND="dev-lang/swig
		cuda? ( dev-util/nvidia-cuda-toolkit )
		python? ( dev-lang/swig )"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-cpp/gtest )"

S="${WORKDIR}/${PN}-${PV}"

PATCHES=( "${FILESDIR}"/python_callbacks.patch "${FILESDIR}"/fix_rpaths.patch )

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	default
	local mycmakeargs=(
		-DFAISS_ENABLE_GPU="$(usex cuda ON OFF)"
		-DFAISS_ENABLE_PYTHON="$(usex python ON OFF)"
		-DBUILD_SHARED_LIBS="ON"
		-DBUILD_TESTING="$(usex test ON OFF)"
	)

	if use cuda; then
	mycmakeargs+=(
		-DCMAKE_CUDA_FLAGS="$(cuda_gccdir -f | tr -d \")"
	)
	fi

	cmake_src_configure

	if use python ; then
		cmake_src_configure swigfais
		pushd "${S}"_build/faiss/python
		distutils-r1_src_configure
		popd
	fi
}

src_compile() {
	default
	cmake_src_compile faiss

	if use python ; then
		cmake_src_compile swigfaiss
		pushd "${S}"_build/faiss/python
		distutils-r1_src_compile
		popd
	fi

}

src_install() {
	default
	cmake_src_install

	if use python ; then
		cmake_src_install swigfaiss
		pushd "${S}"_build/faiss/python
		distutils-r1_src_install
		popd
	fi
}
