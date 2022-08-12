# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{9,10,11})

inherit git-r3 distutils-r1

DESCRIPTION="hidapi bindings in ctypes"
HOMEPAGE="https://github.com/apmorton/pyhidapi"
EGIT_REPO_URI="https://github.com/apmorton/pyhidapi.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
