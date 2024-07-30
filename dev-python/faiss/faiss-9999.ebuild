# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit git-r3 cmake distutils-r1

DESCRIPTION="A library for efficient similarity search and clustering of dense vectors."
HOMEPAGE="faiss.ai "
EGIT_REPO_URI="https://github.com/facebookresearch/faiss.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docsgpu test"

DEPEND="dev-lang/swig
		dev-python/numpy"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-cpp/gtest )"

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	default
	cd "${S}"_build/faiss/python
	cmake_src_prepare
	distutils-r1_src_prepare
}

src_configure() {
	default
	cmake_src_configure

	cd "${S}"_build/faiss/python
	local mycmakeargs=(
		-DFAISS_ENABLE_GPU="$(usex gpu ON OFF)"
		-DFAISS_ENABLE_PYTHON="$(usex python ON OFF)"
		-DBUILD_SHARED_LIBS="ON"
		-DBUILD_TESTING="$(usex test ON OFF)"
	)
	cmake_src_configure
}

src_compile() {
	default
	cd "${S}"_build/faiss/python
	cmake_src_compile
	distutils-r1_src_compile
}

src_install() {
	default
	cd "${S}"_build/faiss/python
	cmake_src_install
	distutils-r1_src_install
}
