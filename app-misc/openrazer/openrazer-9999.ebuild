# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1 python-r1 git-r3 udev desktop linux-mod

DESCRIPTION="Drivers for Razer peripherals on GNU/Linux"
HOMEPAGE="https://openrazer.github.io/"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"

LICENSE="GPL-2"
SLOT="0"

IUSE="+daemon doc client"
REQUIRED_USE="
	daemon? ( ${PYTHON_REQUIRED_USE} )
	client? ( daemon )
"

RDEPEND="
	daemon? ( ${PYTHON_DEPS}
		media-libs/libsdl2
		media-libs/sdl2-image
		sci-libs/fftw:3.0
		dev-python/daemonize[$PYTHON_USEDEP]
		dev-python/dbus-python[$PYTHON_USEDEP]
		dev-python/notify2[$PYTHON_USEDEP]
		dev-python/pygobject:3[$PYTHON_USEDEP]
		dev-python/python-evdev[$PYTHON_USEDEP]
		dev-python/pyudev[$PYTHON_USEDEP]
		dev-python/setproctitle[$PYTHON_USEDEP]
		x11-libs/gtk+:3[introspection]
		x11-misc/xautomation
		x11-misc/xdotool
		acct-group/plugdev
	)
	client? ( dev-python/numpy[$PYTHON_USEDEP] )
	"
DEPEND="${RDEPEND}
	app-misc/jq
	virtual/linux-sources
"

DOCS=( README.md )

# This is a bit weird, but it's end result is what we want.
BUILD_TARGETS="clean driver"
BUILD_PARAMS="-C ${S} SUBDIRS=${S}/driver KERNELDIR=${KERNEL_DIR}"
MODULE_NAMES="
	razerkbd(hid:${S}/driver)
	razermouse(hid:${S}/driver)
	razerkraken(hid:${S}/driver)
	razeraccessory(hid:${S}/driver)
"

src_compile() {
	linux-mod_src_compile

	python_compile() {
		if use daemon; then
			pushd daemon
			distutils-r1_python_compile
			popd
		fi
		if use client; then
			pushd pylib
			distutils-r1_python_compile
			popd
		fi
	}
	python_foreach_impl python_compile
}

src_install() {
	linux-mod_src_install

	# TODO: should this be configurable with udev use? does it work without?
	# It needs manual rebinding, so I think this is pretty crucial.
	udev_dorules install_files/udev/99-razer.rules
	exeinto "$(get_udevdir)"
	doexe install_files/udev/razer_mount

	# Insert conf.example so that the daemon doesn't complain
		insinto "/usr/share/${PN}"
		newins daemon/resources/razer.conf razer.conf.example

	python_install() {
		if use daemon; then
			pushd daemon
			distutils-r1_python_install
			python_scriptinto /usr/bin
			python_newscript run_openrazer_daemon.py openrazer-daemon
			popd
		fi
		if use client; then
			pushd pylib
			distutils-r1_python_install
			popd
		fi
	}
	python_foreach_impl python_install
}
