# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1

DESCRIPTION="lazyarray provides a lazily-evaluated numerical array class"
HOMEPAGE="https://github.com/NeuralEnsemble/lazyarray"
SRC_URI="https://github.com/NeuralEnsemble/lazyarray/archive/refs/tags/0.5.0.tar.gz"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy"
RDEPEND="${DEPEND}"
BDEPEND=""
