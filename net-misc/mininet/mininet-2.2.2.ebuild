# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Process-based network emulator"
HOMEPAGE="https://mininet.org"

SRC_URI="https://github.com/mininet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MININET"
SLOT="0"
IUSE="doc test tools xhost"

DEPEND="${PYTHON_DEPS}
	dev-python/networkx[${PYTHON_USEDEP}]
	sys-apps/net-tools[hostname]
	net-misc/iputils
	dev-python/setuptools[${PYTHON_USEDEP}]
	net-misc/iperf:2
	net-misc/openvswitch
	dev-libs/libcgroup"

RDEPEND="${DEPEND}
	|| (
		net-misc/netkit-telnetd
		net-misc/telnet-bsd
	)
	sys-process/procps
	tools? (
		net-misc/socat
		sys-process/psmisc
		net-misc/iperf
		x11-terms/xterm
		sys-apps/ethtool
	)
	xhost? ( x11-apps/xhost )"

src_compile(){
	distutils-r1_src_compile
	emake mnexec
	emake man
}

src_install(){
	distutils-r1_src_install
	dobin mnexec
	doman mn.1
	doman mnexec.1
	use doc && dodoc
}
