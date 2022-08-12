# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3

DESCRIPTION="A major emacs mode for editing hare source code"
HOMEPAGE="https://git.sr.ht/~bbuccianti/hare-mode"
EGIT_REPO_URI="https://git.sr.ht/~bbuccianti/hare-mode"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DOCS=( README.md )
SITEFILE="50${PN}-gentoo.el"
