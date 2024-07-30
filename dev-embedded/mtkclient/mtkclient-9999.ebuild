# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit git-r3 distutils-r1

DESCRIPTION="MTK reverse engineering and flash tool"
HOMEPAGE=" MTK reverse engineering and flash tool "
EGIT_REPO_URI="https://github.com/bkerler/mtkclient.git"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/keystone[python]
		dev-libs/capstone[python]
		dev-util/unicorn[python]
		dev-python/pycryptodome
		dev-python/colorama
		dev-python/shiboken6
		dev-python/pyside6
		dev-python/mock
		dev-python/pyserial
		dev-python/flake8
		dev-python/fusepy"
RDEPEND="${DEPEND}"
BDEPEND=""
