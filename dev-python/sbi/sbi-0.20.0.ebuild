# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://www.mackelab.org/sbi/"
SRC_URI="https://github.com/mackelab/sbi/archive/refs/tags/v0.20.0.tar.gz -> ${P}.tar.gz"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/arviz
		>=dev-python/joblib-1.0.0
		dev-python/matplotlib
		dev-python/numpy
		dev-python/pillow
		>=dev-python/pyknos-0.15.1
		>=dev-python/pyro-1.3.1
		sci-libs/scikit-learn
		dev-python/scipy
		>=sci-libs/pytorch-1.8.0
		"
RDEPEND="${DEPEND}"
BDEPEND=""
