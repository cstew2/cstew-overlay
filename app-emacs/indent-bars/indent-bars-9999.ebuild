# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=27.1

inherit elisp git-r3

DESCRIPTION="Fast, configurable indentation guide-bars for Emacs"
HOMEPAGE="https://github.com/jdtsmith/indent-bars/"
EGIT_REPO_URI="https://github.com/jdtsmith/${PN}.git"
KEYWORDS=""

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	app-emacs/compat
"
BDEPEND="
	${RDEPEND}
"

SITEFILE="50${PN}-gentoo.el 50${PN}-ts-gentoo.el"
DOCS=( README.md examples.md )
