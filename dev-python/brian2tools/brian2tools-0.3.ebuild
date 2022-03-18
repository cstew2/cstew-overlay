# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Tools to use with Brian 2, in particular for visualization"
HOMEPAGE="https://github.com/brian-team/brian2tools"
SRC_URI="https://github.com/brian-team/brian2tools/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/brian
		dev-python/matplotlib"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}2-${PV}"
