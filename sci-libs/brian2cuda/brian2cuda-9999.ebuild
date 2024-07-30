# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{11,12})

inherit distutils-r1 git-r3

DESCRIPTION="Run Brian 2 code on the GPU using generated CUDA code"
HOMEPAGE="https://github.com/brian-team/brian2cuda"
EGIT_REPO_URI="https://github.com/brian-team/brian2cuda.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

DEPEND="dev-python/brian"
RDEPEND="${DEPEND}"
BDEPEND=""
