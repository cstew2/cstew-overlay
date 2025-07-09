# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 git-r3

DESCRIPTION="Animation engine for explanatory math videos"
HOMEPAGE="https://github.com/3b1b/manim"
EGIT_REPO_URI="https://github.com/ManimCommunity/manim.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gui jupyter"

RESTRICT="test"

DEPEND="dev-python/av
		dev-python/beautifulsoup4
		dev-python/click
		dev-python/cloup
		dev-python/decorator
		dev-python/isosurfaces
		dev-python/ManimPango
		dev-python/mapbox-earcut
		dev-python/moderngl-window
		dev-python/moderngl
		dev-python/networkx
		dev-python/numpy
		dev-python/pillow
		dev-python/pycairo
		dev-python/pydub
		dev-python/pygments
		dev-python/rich
		dev-python/scipy
		dev-python/screeninfo
		dev-python/skia-pathops
		dev-python/srt
		dev-python/svgelements
		dev-python/tqdm
		dev-python/typing-extensions
		dev-python/watchdog
		gui? ( >=dev-python/dearpygui-1.0.0 )
		jupyter? ( >=dev-python/jupyterlab-4.3.4
				   >=dev-python/notebook-7.3.2 )"

RDEPEND="${DEPEND}"
BDEPEND=""
