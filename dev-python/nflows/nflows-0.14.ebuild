# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1

DESCRIPTION="Normalizing flows in PyTorch"
HOMEPAGE="https://github.com/bayesiains/nflows"
SRC_URI="https://github.com/bayesiains/nflows/archive/refs/tags/v0.14.tar.gz -> ${P}.tar.gz"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

PATCHES=("${FILESDIR}/fix_setup.patch")

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
