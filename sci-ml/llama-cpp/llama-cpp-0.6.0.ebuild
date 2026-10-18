# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="LLM inference in C/C++"
HOMEPAGE="llama.app"

SRC_URI="https://github.com/ggml-org/llama.cpp/archive/refs/tags/v${PV}.tar.gz -> llama-cpp-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror test"

DEPEND="sci-ml/ggml"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/llama.cpp-${PV}"

src_configure() {
	local mycmakeargs=(
		-DLLAMA_BUILD_UI=OFF
		-DLLAMA_BUILD_EXAMPLES=OFF
		-DLLAMA_BUILD_APP=OFF
		-DLLAMA_OPENSSL=OFF
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_LLGUIDANCE=OFF
		-DLLAMA_BUILD_IS_DEV=ON
		-DLLAMA_BUILD_COMMON=ON
		-DLLAMA_BUILD_TOOLS=ON
		-DLLAMA_BUILD_SERVER=ON
		-DBUILD_SHARED_LIBS=ON
		-DLLAMA_USE_SYSTEM_GGML=ON
	)
	cmake_src_configure
}
