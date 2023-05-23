# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

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
		dev-python/textX
		"
RDEPEND="${DEPEND}"
BDEPEND=""
