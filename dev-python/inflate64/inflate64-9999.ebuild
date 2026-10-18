# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="inflate64 is a python package to provide decompression(inflate) of deflate64(tm) algorithm."
HOMEPAGE="https://github.com/miurahr/inflate64"
EGIT_REPO_URI="https://github.com/miurahr/inflate64.git"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
