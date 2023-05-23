# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake cmake-multilib

DESCRIPTION="Audio processing library for changing tempo, pitch and playback rates"
HOMEPAGE="https://www.surina.net/soundtouch/ https://gitlab.com/soundtouch/soundtouch"
EGIT_REPO_URI="https://codeberg.org/soundtouch/soundtouch.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~hppa ~mips ppc ppc64 ~riscv x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"
IUSE="openmp"

BDEPEND="virtual/pkgconfig"

PATCHES=("${FILESDIR}/low-level.patch")

src_prepare() {
	cmake_src_prepare
	sed -i -e 's/check_require_components/check_required_components/g' SoundTouchConfig.cmake.in || die
}

multilib_src_configure() {
	local mycmakeargs=(
		-DSOUNDTOUCH_DLL=ON
		-DOPENMP=$(usex openmp)
		-DSOUNDSTRETCH=ON
	)
	cmake_src_configure
}
