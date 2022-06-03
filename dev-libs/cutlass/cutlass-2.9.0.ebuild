# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FORTRAN_NEEDED="test"
inherit cmake cuda

DESCRIPTION="CUDA Templates for Linear Algebra Subroutines"
HOMEPAGE="https://eigen.tuxfamily.org/index.php?title=Main_Page"
EGIT_REPO_URI="https://gitlab.com/libeigen/${PN}.git"

LICENSE="BSD"
SLOT=""
KEYWORDS=""
IUSE="doc"

BDEPEND="doc? ( app-doc/doxygen )"
DEPEND=""
