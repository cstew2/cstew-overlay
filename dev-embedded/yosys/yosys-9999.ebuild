# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13,14} )
LLVM_COMPAT=( {18..21} )
EGIT_SUBMODULES=( cxxopts fmt slang sv-elab symfpu )
inherit git-r3 cmake llvm-r2 python-any-r1

DESCRIPTION="Yosys Open SYnthesis Suite. This is a framework for RTL synthesis tools."
HOMEPAGE="https://www.clifford.at/yosys/"
EGIT_REPO_URI="https://github.com/YosysHQ/yosys.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-cpp/tomlplusplus
		dev-embedded/abc
		dev-libs/boost[python,zlib]
		dev-libs/libffi
		dev-lang/tcl
		$(llvm_gen_dep 'llvm-core/clang:${LLVM_SLOT}=')
		media-gfx/graphviz
		media-gfx/xdot
		sys-apps/gawk
		sys-libs/readline
		sys-libs/zlib
		"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig
		app-alternatives/lex
		app-alternatives/yacc
		"

pkg_setup() {
	llvm-r2_pkg_setup
	python_setup
}

src_configure() {
	local mycmakeargs=(
		"-DYOSYS_ABC_EXECUTABLE=${EPREFIX}/usr/bin/abc"
		"-DYOSYS_INSTALL_DRIVER=ON"
		"-DYOSYS_USE_BUNDLED_LIBS=OFF"
		"-DPython3_EXECUTABLE=${PYTHON}"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	python_fix_shebang "${ED}"/usr/bin/yosys-smtbmc "${ED}"/usr/bin/yosys-witness
}
