# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FORTRAN_NEEDED="test"
inherit cmake git-r3

DESCRIPTION="A header-only C++ library for large scale eigenvalue problems"
HOMEPAGE="https://spectralib.org/"
EGIT_REPO_URI="https://github.com/yixuan/spectra.git"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT=""

RDEPEND=""
BDEPEND=">=dev-util/cmake-3.5"
DEPEND="dev-cpp/eigen:3
	   "
src_prepare() {
	default
	mkdir
	sed -i -e '61s/cmake/share\/Spectra/' CMakeLists.txt || die
	sed -i -e '85s/cmake/share\/Spectra/' CMakeLists.txt || die
	cmake_src_prepare
}
