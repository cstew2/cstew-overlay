# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A suite of utilities for programming Xilinx FPGAs"
HOMEPAGE="https://sourceforge.net/projects/xc3sprog/"
SRC_URI="https://github.com/matrix-io/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ftdi ftd2xx"

DEPEND="ftdi? ( dev-embedded/libftdi:1 )
		ftd2xx? ( dev-embedded/libftd2xx )
		dev-embedded/wiringPi
		virtual/libusb:0"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		"-DLIBFTDI_FOUND=TRUE"
		"-DLIBFTDI_INCLUDE_DIR=/usr/include/libftdi1"
		"-DLIBFTDI_LIBRARIES=-lftdi1"

		"-DUSE_FTD2XX=FALSE"
		"-DLIBFTD2XX_FOUND=TRUE"
		"-DLIBFTD2XX_INCLUDE_DIR=/usr/include"
		"-DCMAKE_EXE_LINKER_FLAGS=-L/opt/lib64"
		"-DLIBFTD2XX_LIBRARIES=-lftd2xx"

		"-DLIBUSB_FOUND=TRUE"
		"-DLIBUSB_INCLUDE_DIR=/usr/include/"
		"-DLIBUSB_LIBRARIES=-lusb"
	)

	cmake-utils_src_configure
}
