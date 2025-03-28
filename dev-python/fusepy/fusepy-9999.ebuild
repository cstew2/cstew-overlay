# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 distutils-r1

DESCRIPTION="Simple ctypes bindings for FUSE"
HOMEPAGE="https://github.com/fusepy/fusepy"
EGIT_REPO_URI="https://github.com/fusepy/fusepy.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"	# No usable test phases

DEPEND="sys-fs/fuse:0"
RDEPEND="${DEPEND}"
