# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="Run Brian 2 code on the GPU using generated CUDA code"
HOMEPAGE="https://github.com/brian-team/brian2cuda"
EGIT_REPO_URI="https://github.com/brian-team/brian2cuda.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="sci-libs/brian"
RDEPEND="${DEPEND}"
BDEPEND=""
