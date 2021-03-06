# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

inherit git-r3 distutils-r1

DESCRIPTION="Parse strings using a specification based on the Python format() syntax."
HOMEPAGE="https://github.com/r1chardj0n3s/parse"
EGIT_REPO_URI="https://github.com/r1chardj0n3s/parse.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
