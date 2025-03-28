# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 distutils-r1

DESCRIPTION="Visualkeras is a Python package to help visualize Keras"
HOMEPAGE="Visualkeras is a Python package to help visualize Keras"
EGIT_REPO_URI="https://github.com/paulgavrikov/visualkeras.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/numpy
		dev-python/pillow
		dev-python/aggdraw"
RDEPEND="${DEPEND}"
BDEPEND=""
