# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 git-r3

DESCRIPTION="A client-optimized langauge for fast apps on any platform"
HOMEPAGE="https://dart.dev/"

EGIT_REPO_URI="https://github.com/flutter/flutter.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="examples"

DEPEND="dev-util/android-studio
		net-misc/curl
		dev-vcs/git
		app-arch/unzip
		app-arch/zip
		app-arch/xz-utils
		virtual/glu
		"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

src_prepare() {
	default

	# remove Windows batch files
	find . -iname '*.bat' -delete || die
}

src_compile() {
	# - this needs to be done before snapshotting to avoid sdk mismatch error
	# - this includes the analytics notice, so show it in the elog
	einfo "Building completions"
	DOC_CONTENTS=$("bin/${PN}" bash-completion "${PN}.bash-completion") || die
	DISABLE_AUTOFORMATTING=1 readme.gentoo_create_doc
}

src_install() {
	use examples || rm -r examples/ || die

	# unbundle dart-sdk
	ln -s ../../../dart-sdk bin/cache/dart-sdk || die

	newbashcomp "${PN}.bash-completion" "${PN}"
	rm "${PN}.bash-completion"

	mkdir "${D}/opt/" || die
	mv "${S}" "${D}/opt/${PN}" || die

	dosym "../${PN}/bin/${PN}" "/opt/bin/${PN}"
}

pkg_postinst() {
	readme.gentoo_print_elog
}
