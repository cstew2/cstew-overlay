# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
LLVM_COMPAT=({15,16})

inherit distutils-r1 git-r3 llvm-r1

DESCRIPTION="A library for efficient similarity search and clustering of dense vectors"
HOMEPAGE="llvmlite.pydata.org/"
EGIT_REPO_URI="https://github.com/numba/llvmlite.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE="docs test"

DEPEND="sys-devel/llvm:16
		"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
