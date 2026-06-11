# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=(python3_{13,14})

inherit git-r3 distutils-r1

DESCRIPTION=" An easy-to-use Mod Organizer 2 installer for Linux "
HOMEPAGE="https://github.com/Furglitch/modorganizer2-linux-installer"
EGIT_REPO_URI="https://github.com/Furglitch/modorganizer2-linux-installer.git"
EGIT_BRANCH="rewrite"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/certifi
		 dev-python/click
		 dev-python/python-dotenv
		 dev-python/inquirerpy
		 dev-python/loguru
		 app-arch/patool
		 dev-vcs/pre-commit
		 app-emulation/protontricks
		 dev-python/psutil
		 dev-python/pydantic
		 dev-python/pyinstaller
		 dev-python/pyyaml
		 dev-python/requests
		 dev-util/ruff
		 dev-python/send2trash
		 dev-python/websockets
"
DEPEND="${RDEPEND}"
BDEPEND=""
