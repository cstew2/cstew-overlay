# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 cmake

DESCRIPTION="A standalone profiler and debugging tool from Google"
HOMEPAGE="https://orbitprofiler.com/"
EGIT_REPO_URI="https://github.com/google/orbit.git"

LICENSE="BSD-2"
SLOT="0"
IUSE="test gui vulkan"

RDEPEND=""
DEPEND="${RDEPEND}
		gui? ( virtual/opengl
			   dev-qt/qtcore:5
			   dev-qt/qtnetwork:5
			   dev-qt/qtwidgets:5
			   net-libs/libssh2 )
		dev-util/android-tools
		vulkan? ( dev-libs/volk
				  dev-util/vulkan-headers
				  media-libs/vulkan-layers )
		app-arch/lzma
		dev-cpp/abseil-cpp
		dev-libs/capstone
		dev-libs/xxhash
		net-libs/grpc
		sys-devel/llvm
		dev-libs/openssl
		dev-libs/protobuf
		sys-libs/zlib"

BDEPEND="test? ( dev-cpp/gtest )"

PATCHES=( "${FILESDIR}/fix_vulkan_include.patch"
		  "${FILESDIR}/fix_VK_LAYER_EXPORT.patch"
		  "${FILESDIR}/use_system.patch" )

src_configure() {
		local mycmakeargs=(
			-DVULKAN_VALIDATION_INC_DIR=/usr/include
			-DCMAKE_SKIP_RPATH=ON
		)
		cmake_src_configure
}

src_install() {
	dobin "${PORTAGE_BUILDDIR}/work/${P}_build/bin/Orbit"
	dobin "${PORTAGE_BUILDDIR}/work/${P}_build/bin/OrbitService"
	dobin "${PORTAGE_BUILDDIR}/work/${P}_build/bin/OrbitClientGgp"

	dolib.so "${PORTAGE_BUILDDIR}/work/${P}_build/lib/liborbit.so"
	dolib.so "${PORTAGE_BUILDDIR}/work/${P}_build/lib/liborbituserspaceinstrumentation.so"
	if use vulkan; then
		dolib.so "${PORTAGE_BUILDDIR}/work/${P}_build/lib/libOrbitVulkanLayer.so"
		insinto "${EPREFIX}/usr/$(get_libdir)"
		doins "${PORTAGE_BUILDDIR}/work/${P}_build/lib/VkLayer_Orbit_implicit.json"
	fi
}
