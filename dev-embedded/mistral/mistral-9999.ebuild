# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake

DESCRIPTION="Bitstream documentation for Gowin FPGAs"
HOMEPAGE="https://github.com/YosysHQ/apicula"
EGIT_REPO_URI="https://github.com/YosysHQ/apicula.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
