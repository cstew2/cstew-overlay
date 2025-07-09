# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Generic API for dispatch to Pyro backends."
HOMEPAGE="https://pyro.ai/api"
SRC_URI="https://github.com/pyro-ppl/pyro-api/archive/refs/tags/0.1.1.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
