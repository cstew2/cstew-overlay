# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 git-r3

DESCRIPTION="Configuring a package including defaults, env variable loading, and yaml loading"
HOMEPAGE="https://donfig.readthedocs.io/en/latest"
EGIT_REPO_URI="https://github.com/pytroll/donfig.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docs test"

DEPEND=""

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-python/pytest )"

S="${WORKDIR}/${PN}-${PV}"
