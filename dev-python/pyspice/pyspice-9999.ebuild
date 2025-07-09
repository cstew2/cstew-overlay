# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit git-r3 distutils-r1

DESCRIPTION="Simulate electronic circuit using Python and the Ngspice/Xyce simulators"
HOMEPAGE="https://pyspice.fabrice-salvaire.fr/"
EGIT_REPO_URI="https://github.com/PySpice-org/PySpice.git"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/pyyaml
		dev-python/cffi
		dev-python/matplotlib
		dev-python/numpy
		dev-python/ply
		dev-python/scipy"
RDEPEND="${DEPEND}"
BDEPEND=""
