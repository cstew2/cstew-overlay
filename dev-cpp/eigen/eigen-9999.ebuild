# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FORTRAN_NEEDED="test"
inherit cmake git-r3 cuda fortran-2

DESCRIPTION="C++ template library for linear algebra"
HOMEPAGE="http://eigen.tuxfamily.org/"
EGIT_REPO_URI="https://gitlab.com/libeigen/${PN}.git"

LICENSE="MPL-2.0"
SLOT="3"
KEYWORDS="~amd64"
IUSE="altivec c++11 cpu_flags_arm_neon cuda debug doc openmp test" #zvector vsx
RESTRICT="!test? ( test )"

RDEPEND="!dev-cpp/eigen:0"
DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	doc? (
		app-doc/doxygen[dot]
		dev-texlive/texlive-bibtexextra
		dev-texlive/texlive-fontsextra
		dev-texlive/texlive-fontutils
		dev-texlive/texlive-latex
		dev-texlive/texlive-latexextra
	)
	test? (
		dev-libs/gmp:0
		dev-libs/mpfr:0
		media-libs/freeglut
		media-libs/glew
		sci-libs/adolc[sparse]
		sci-libs/cholmod
		sci-libs/fftw:3.0
		sci-libs/pastix
		sci-libs/umfpack
		sci-libs/scotch
		sci-libs/spqr
		sci-libs/superlu
		virtual/opengl
		virtual/pkgconfig
	)
"
src_prepare() {
	cmake-utils_src_prepare

	sed -e 's:-g2::g' \
		-i cmake/EigenConfigureTesting.cmake || die

	sed -e "/add_subdirectory(demos/d" \
		-i CMakeLists.txt || die

	if ! use test; then
		sed -e "/add_subdirectory(test/d" \
			-i CMakeLists.txt || die

		sed -e "/add_subdirectory(blas/d" \
			-e "/add_subdirectory(lapack/d" \
			-i CMakeLists.txt || die
	fi
	sed -e "/Unknown build type/d" \
		-i CMakeLists.txt || die

	use cuda && cuda_src_prepare
}

src_compile() {
	cmake-utils_src_compile
	use doc && cmake-utils_src_compile doc
}

src_test() {
	local mycmakeargs=(
		-DEIGEN_TEST_NOQT=ON
		-DEIGEN_TEST_ALTIVEC="$(usex altivec)"
		-DEIGEN_TEST_CXX11="$(usex c++11)"
		-DEIGEN_TEST_CUDA="$(usex cuda)"
		-DEIGEN_TEST_OPENMP="$(usex openmp)"
		-DEIGEN_TEST_NEON64="$(usex cpu_flags_arm_neon)"
	)
	cmake-utils_src_configure
	cmake-utils_src_compile blas
	cmake-utils_src_compile buildtests
	cmake-utils_src_test
}

src_install() {
	use doc && local HTML_DOCS=( "${BUILD_DIR}"/doc/html/. )
	cmake-utils_src_install

	# Debian installs it and some projects started using it.
	insinto /usr/share/cmake/Modules/
	doins "${S}/cmake/FindEigen3.cmake"
}
