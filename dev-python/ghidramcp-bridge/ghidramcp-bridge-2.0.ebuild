# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=(python3_{13,14})
EGIT_SUBMODULES=()

inherit  distutils-r1

DESCRIPTION="Bridge for MCP Server for Ghidra"
HOMEPAGE="https://github.com/LaurieWired/GhidraMCP"
SRC_URI="https://github.com/LaurieWired/GhidraMCP/archive/refs/tags/2.0.tar.gz ->  ${P}.tar.gz"

LICENSE="Apache2.0"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/mcp
		dev-python/requests"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/update_mcp.patch"

S="${WORKDIR}/GhidraMCP-${PV}"
