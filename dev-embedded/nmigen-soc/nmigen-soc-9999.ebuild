# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="System on Chip toolkit for nMigen"
HOMEPAGE="https://github.com/m-labs/nmigen-soc"
EGIT_REPO_URI="https://github.com/m-labs/nmigen-soc.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-embedded/nmigen
	   "
RDEPEND="${DEPEND}"
BDEPEND=""
