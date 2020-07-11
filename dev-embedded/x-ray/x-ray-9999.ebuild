# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_5,3_6,3_7,3_8})

inherit git-r3 cmake

DESCRIPTION="Documenting the Xilinx 7-series bit-stream format."
HOMEPAGE="https://symbiflow.github.io/prjxray-db/"
EGIT_REPO_URI="https://github.com/SymbiFlow/prjxray.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test fuzzers artix7 artix7_100t artix7_200t kintex7 zynq7 zynq7010"

DEPEND="dev-python/pyyaml
		dev-python/junit-xml
		dev-python/numpy
		dev-python/intervaltree
		dev-python/openpyxl
		dev-python/ordered-set
		dev-python/parse
		dev-python/progressbar2
		dev-python/json5
		dev-python/pytest
		dev-python/pyyaml
		dev-python/simplejson
		dev-python/sympy
		dev-python/textx
		dev-python/yapf
		"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
		if use test ; then
		local mycmakeargs=(
			-DPRJXRAY_BUILD_TESTING=ON
		)
		fi

		cmake_src_configure
}

src_compile() {
	emake build

	if use fuzzers ; then
		if use artix7 ; then
			source ${S}/settings/artix7.sh
		elif use artix7_100t ; then
			source ${S}/settings/artix7_100t.sh
		elif use artix7_200t ; then
			source ${S}/settings/artix7_200t.sh
		elif use kintex7 ; then
			source ${S}/settings/kintex7.sh
		elif use zynq7 ; then
			source ${S}/settings/zynq7.sh
		elif use zynq7010 ; then
			source ${S}/settings/zynq7010.sh
		else
			source ${S}/settings/artix7.sh
		fi

		cd ${S}/fuzzers/
		emake
	fi
}

src_install() {
	dobin ${S}/build/tools/xc7frames2bit
	dobin ${S}/build/tools/frame_address_decoder
	dobin ${S}/build/tools/bittool
	dobin ${S}/build/tools/gen_part_base_yaml
	dobin ${S}/build/tools/bitread
	dobin ${S}/build/tools/xc7patch
}
