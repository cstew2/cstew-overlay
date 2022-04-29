# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/enjoy-digital/litex"
SRC_URI="https://github.com/enjoy-digital/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/pyserial
		dev-python/requests
	   "
RDEPEND="${DEPEND}"
BDEPEND=""
