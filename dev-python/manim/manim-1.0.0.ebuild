# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Animation engine for explanatory math videos "
HOMEPAGE="https://github.com/3b1b/manim"
SRC_URI="https://github.com/3b1b/manim/archive/refs/tags/v1.0.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"
BDEPEND=""
