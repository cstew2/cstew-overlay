# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 distutils-r1

DESCRIPTION="FPGA Assembly (FASM) Parser and Generator"
HOMEPAGE="https://github.com/SymbiFlow/fasm"
EGIT_REPO_URI="https://github.com/SymbiFlow/fasm.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/textx
		dev-java/antlr:*
		dev-cpp/antlr-cpp:*
		dev-cpp/gtest"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/build_system.patch" ) #"${FILESDIR}/antlr.patch" )

python_compile() {
	distutils-r1_python_compile --antlr-runtime=shared
}

python_install() {
	distutils-r1_python_install --antlr-runtime=shared
}
