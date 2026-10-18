# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="PPMd compression/decompression library"
HOMEPAGE="https://pyppmd.readthedocs.io"
EGIT_REPO_URI="https://github.com/miurahr/pyppmd.git"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
