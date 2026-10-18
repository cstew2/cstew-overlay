# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1
PYTHON_COMPAT=(python3_{13,14})

inherit git-r3 distutils-r1

DESCRIPTION="A Linux native mod manager for a variety of games"
HOMEPAGE="https://github.com/ChrisDKN/Amethyst-Mod-Manager/tree/main"
EGIT_REPO_URI="https://github.com/ChrisDKN/Amethyst-Mod-Manager.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
$(python_gen_cond_dep '
		dev-python/pyside[${PYTHON_USEDEP}]
		dev-python/py7zr[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/lz4[${PYTHON_USEDEP}]
		dev-python/zstandard[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/keyring[${PYTHON_USEDEP}]
		dev-python/jeepney[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/bsdiff4[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/secretstorage[${PYTHON_USEDEP}]
		dev-python/certifi[${PYTHON_USEDEP}]
')
"
DEPEND="${RDEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/add_pyproject.patch" )
