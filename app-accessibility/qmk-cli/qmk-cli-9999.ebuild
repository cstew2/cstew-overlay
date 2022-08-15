# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{9,10,11})

inherit git-r3 distutils-r1

DESCRIPTION="A program to help users work with QMK "
HOMEPAGE="https://qmk.fm/"
EGIT_REPO_URI="https://github.com/qmk/qmk_cli.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/milc
		dev-python/hid
		dev-python/usb
		dev-python/hjson
		dev-python/dotty-dict
		dev-embedded/dfu-programmer
		app-mobilephone/dfu-util
		dev-libs/hidapi
		dev-libs/libusb"
RDEPEND="${DEPEND}"
BDEPEND=""
