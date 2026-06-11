# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})
inherit git-r3 distutils-r1

DESCRIPTION="A domain specific language to describe neuron models in NEST"
HOMEPAGE="https://github.com/nest/nestml"
EGIT_REPO_URI="https://github.com/nest/nestml.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="docs test"

DEPEND="dev-python/numpy
		dev-python/sympy
		dev-python/scipy
		dev-python/antlr4-python3-runtime
		dev-python/jinja2
		dev-python/astropy
		dev-python/semver
		dev-python/odetoolbox"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/fix_setup.patch" )
