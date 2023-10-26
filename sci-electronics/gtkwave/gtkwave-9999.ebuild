# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 autotools

DESCRIPTION="A wave viewer for LXT, LXT2, VZT, GHW and standard Verilog VCD/EVCD files"
HOMEPAGE="http://gtkwave.sourceforge.net/"
EGIT_REPO_URI="https://github.com/gtkwave/gtkwave.git"

LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples fasttree judy lzma packed tcl"

RDEPEND="
	dev-libs/glib:2
	sys-libs/zlib
	app-arch/bzip2
	x11-libs/pango
	x11-libs/gtk+:3
	judy? ( dev-libs/judy )
	tcl? ( dev-lang/tcl:0 dev-lang/tk:0 )
	lzma? ( app-arch/xz-utils )"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/gperf
	virtual/pkgconfig"

# Add '-gtk3-' to the pacakge name
S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	default

	# do not install doc and examples by default
	sed -i -e 's/doc examples//' Makefile.in || die
}

src_configure() {
	econf \
		--disable-mime-update \
		--enable-largefile \
		--enable-gtk3 \
		$(use_enable packed struct-pack) \
		$(use_enable tcl) \
		$(use_enable lzma xz) \
		$(use_enable fasttree) \
		$(use_enable judy)
}

src_compile() {
	emake AR="$(tc-getAR)"
}

src_install() {
	default

	use doc && dodoc doc/${PN}.odt
	if use examples; then
		rm examples/Makefile* || die
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
