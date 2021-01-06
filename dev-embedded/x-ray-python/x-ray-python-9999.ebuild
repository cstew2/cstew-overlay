# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 distutils-r1

DESCRIPTION="Documenting the Xilinx 7-series bit-stream format."
HOMEPAGE="https://symbiflow.github.io/prjxray-db/"
EGIT_REPO_URI="https://github.com/SymbiFlow/prjxray.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-embedded/fasm
		dev-embedded/sdf-timing
		dev-python/pyyaml
		dev-python/junit-xml
		dev-python/numpy
		dev-python/intervaltree
		dev-python/openpyxl
		dev-python/ordered-set
		dev-python/parse
		dev-python/progressbar2
		dev-python/json5
		dev-python/pytest
		dev-python/pyyaml
		dev-python/simplejson
		dev-python/sympy
		dev-python/textx
		dev-python/yapf
		"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/add_utils_module.patch"  )
