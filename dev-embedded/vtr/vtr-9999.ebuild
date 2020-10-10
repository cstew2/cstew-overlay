# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3

DESCRIPTION="Verilog to Routing -- Open Source CAD Flow for FPGA Research"
HOMEPAGE="https://verilogtorouting.org/"
EGIT_REPO_URI="https://github.com/verilog-to-routing/vtr-verilog-to-routing.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

DEPEND="media-libs/freetype
		x11-libs/libXft
		media-libs/fontconfig
		x11-libs/gtk+:3
		dev-lang/perl
		test? (
			  dev-lang/perl
		)
		"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/flex
		 sys-devel/bison
		 dev-util/cmake
		 doc? ( app-doc/doxygen
				dev-python/sphinx
				dev-python/sphinx_rtd_theme
				dev-python/recommonmark
			  )
		"
