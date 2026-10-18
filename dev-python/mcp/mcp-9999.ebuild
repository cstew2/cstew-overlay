# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=(python3_{13,14})
EGIT_SUBMODULES=()

inherit git-r3 distutils-r1

DESCRIPTION="Python SDK for Model Context Protocol servers and clients"
HOMEPAGE="https://py.sdk.modelcontextprotocol.io/"
EGIT_SRC_REPO="https://github.com/modelcontextprotocol/python-sdk.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/jinja2
		dev-python/markupsafe
		dev-python/dunamai
		dev-python/pathspec
		dev-pytohn/pluggy
		dev-python/tomlkit
		dev-python/trove-classifiers"
RDEPEND="${DEPEND}"
