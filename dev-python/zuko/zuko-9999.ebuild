# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Normalizing flows in PyTorch"
HOMEPAGE="zuko.readthedocs.io"
EGIT_REPO_URI="https://github.com/probabilists/zuko.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/numpy
		sci-ml/pytorch
		"
RDEPEND="${DEPEND}"
BDEPEND=""
