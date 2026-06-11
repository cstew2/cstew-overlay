# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{13,14})

inherit git-r3 cmake

DESCRIPTION="A python and C++ library for reading and writing neuronal morphologies"
HOMEPAGE="https://github.com/BlueBrain/MorphIO/"
EGIT_REPO_URI="https://github.com/BlueBrain/MorphIO.git"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/numpy-1.14.1"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"
