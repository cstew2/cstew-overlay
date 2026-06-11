# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})

inherit distutils-r1 git-r3

DESCRIPTION=""
HOMEPAGE="numba.pydata.org/"
EGIT_REPO_URI="https://github.com/numba/numba.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE="docs test"

DEPEND="dev-python/llvmlite
		dev-python/numpy
		"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
