# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Run an ffmpeg command with progress "
HOMEPAGE="Run an ffmpeg command with progress "
EGIT_REPO_URI="https://github.com/slhck/ffmpeg-progress-yield.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="docs extra test"

DEPEND=""
RDEPEND="media-video/ffmpeg
		 ${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"
