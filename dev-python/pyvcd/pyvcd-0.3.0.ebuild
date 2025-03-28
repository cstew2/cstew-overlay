# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1

DESCRIPTION="Python package for writing Value Change Dump (VCD) files. "
HOMEPAGE="https://github.com/westerndigitalcorporation/pyvcd"
SRC_URI="https://github.com/westerndigitalcorporation/pyvcd/releases/download/${PV}/${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/black
		dev-python/flake8
		>=dev-python/isort-5.0.5
		>=dev-python/mypy-0.770

	   "
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest
				dev-python/pytest-cov )"
