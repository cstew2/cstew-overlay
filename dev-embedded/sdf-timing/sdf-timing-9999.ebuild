# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_8,3_9})

inherit git-r3 distutils-r1

DESCRIPTION="Python library for working Standard Delay Format (SDF) Timing Annotation files."
HOMEPAGE="https://github.com/SymbiFlow/python-sdf-timing"
EGIT_REPO_URI="https://github.com/SymbiFlow/python-sdf-timing.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-python/ply
		dev-python/pyjson
		test? ( dev-python/pytest
				dev-python/tox
				dev-python/yapf )
		"

RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/remove-testing.patch" )
