# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cuda cmake git-r3

DESCRIPTION="An efficient C++17 GPU numerical computing library with Python-like syntax"
HOMEPAGE="nvidia.github.io/MatX"
EGIT_REPO_URI="https://github.com/NVIDIA/MatX"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc multi_gpu cutlass cutensor fileio +nvtx visualization"

BDEPEND="doc? ( app-doc/doxygen )"
DEPEND="dev-util/nvidia-cuda-toolkit
		dev-libs/cutlass"

src_configure() {
	local mycmakeargs=(
		-DMATX_DOCS="$(usex doc ON OFF)"
		-DMATX_MULTI_GPU="$(usex multi_gpu ON OFF)"
		-DMATX_EN_CUTLASS="$(usex cutlass ON OFF)"
		-DMATX_EN_CUTENSOR="$(usex cutensor ON OFF)"
		-DMATX_EN_FILEIO="$(usex fileio ON OFF)"
		-DMATX_FLAGS="$(usex nvtx ON OFF)"
		-DMATX_EN_VISUALIZATION="$(usex visualization ON OFF)"
	)
	cmake_src_configure
}
