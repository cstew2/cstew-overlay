# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="Library to convert FASM files to bitstream."
HOMEPAGE="https://github.com/SymbiFlow/xc-fasm"
EGIT_REPO_URI="https://github.com/SymbiFlow/xc-fasm.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-embedded/fasm
		dev-python/simplejson
		dev-python/intervaltree
		dev-python/sympy
		dev-python/textx
		"
RDEPEND="${DEPEND}"
BDEPEND=""
