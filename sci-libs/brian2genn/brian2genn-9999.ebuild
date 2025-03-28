# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="Brian 2 frontend to the GeNN simulator"
HOMEPAGE="https://github.com/brian-team/brian2genn"
EGIT_REPO_URI="https://github.com/brian-team/brian2genn.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="docs"

KEYWORDS="~amd64"
IUSE="docs"

DEPEND=">=sci-libs/brian-2.5
		dev-python/six
		sci-libs/genn
		docs? ( dev-python/sphinx
				dev-python/sphinx-issues )"
RDEPEND="${DEPEND}"
BDEPEND=""
