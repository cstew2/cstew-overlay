# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_P="final_official_${PV}"

DESCRIPTION="PIN based GPIO library written in C for the SoC devices used in all Raspberry Pi"
HOMEPAGE="http://www.wiringPi.com"
SRC_URI="https://github.com/${PN}/${PN}/archive/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

MAKEDIRS=" devLib"

S=${WORKDIR}/WiringPi-${MY_P}

PATCHES=(
	"${FILESDIR}/remove_comDat_alias.patch"
	"${FILESDIR}/use_relative_include_paths.patch"
)

src_compile() {
	cd "${S}"/wiringPi
	emake

	cd "${S}"/devLib
	emake
}

src_install() {
	cd "${S}"/wiringPi
	doheader *.h
	dolib.so libwiringPi.so."${PV}"
	dosym "${ED%/}"/usr/lib64/libwiringPi.so."${PV}" /usr/lib64/libwiringPi.so

	cd "${S}/devLib"
	doheader *.h
	dolib.so "libwiringPiDev.so.${PV}"
	dosym "${ED%/}"/usr/lib64/libwiringPiDev.so."${PV}" /usr/lib64/libwiringPiDev.so
}
