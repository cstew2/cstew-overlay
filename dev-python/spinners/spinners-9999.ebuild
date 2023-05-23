# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit git-r3 distutils-r1

DESCRIPTION="More than 60 spinners for terminal, python wrapper for amazing node library cli-spinners "
HOMEPAGE="https://github.com/manrajgrover/py-spinners"
EGIT_REPO_URI="https://github.com/manrajgrover/py-spinners.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
