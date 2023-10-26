# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 cmake

DESCRIPTION="Meta loader for Vulkan API "
HOMEPAGE="https://github.com/zeux/volk/"
EGIT_REPO_URI="https://github.com/zeux/volk.git"

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		dev-util/vulkan-headers
		media-libs/vulkan-layers"
BDEPEND=""

src_configure() {
		local mycmakeargs=(
				"-DVOLK_INSTALL=1"
		)
		cmake_src_configure
}
