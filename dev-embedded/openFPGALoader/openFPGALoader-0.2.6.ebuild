# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Universal utility for programming FPGA"
HOMEPAGE="https://sourceforge.net/projects/xc3sprog/"
SRC_URI="https://github.com/trabucayre/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ftdi"

DEPEND="ftdi? ( dev-embedded/libftdi:1 )
		virtual/libusb:1"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

DEPEND="ftdi? ( dev-embedded/libftdi:1 )
		virtual/libusb:1"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"
