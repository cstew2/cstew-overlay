# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 distutils-r1

DESCRIPTION="FPGA Assembly (FASM) Parser and Generator"
HOMEPAGE="https://github.com/SymbiFlow/fasm"
EGIT_REPO_URI="https://github.com/SymbiFlow/fasm.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/textx
	   "
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/fix_textx_calls.patch" )
