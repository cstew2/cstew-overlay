# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 git-r3

DESCRIPTION="Representing electrophysiology data with support for neurophysiology file formats"
HOMEPAGE="neo.readthedocs.io/en/latest/"
EGIT_REPO_URI="https://github.com/NeuralEnsemble/python-neo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-python/packaging
		dev-python/numpy
		dev-python/quantities"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
