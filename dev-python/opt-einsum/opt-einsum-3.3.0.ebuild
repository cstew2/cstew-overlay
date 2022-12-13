# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )
inherit distutils-r1

DESCRIPTION="Optimized Einsum: A tensor contraction order optimizer"
HOMEPAGE="https://dgasmith.github.io/opt_einsum/"
SRC_URI="https://github.com/dgasmith/opt_einsum/archive/refs/tags/v3.3.0.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/numpy"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/opt_einsum-${PV}"
