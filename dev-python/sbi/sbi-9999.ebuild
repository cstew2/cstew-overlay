# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{13,14})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="sbi is for simulation-based inference"
HOMEPAGE="https://www.mackelab.org/sbi/"
EGIT_REPO_URI="https://github.com/sbi-dev/sbi.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/arviz
		dev-python/joblib
		dev-python/matplotlib
		dev-python/nflows
		dev-python/numpy
		dev-python/pillow
		dev-python/pyknos
		dev-python/pymc
		dev-python/pyro
		dev-python/scikit-learn
		dev-python/scipy
		dev-python/skorch
		dev-python/tqdm
		dev-python/zuko
		>=sci-ml/pytorch-1.13.0
		"
RDEPEND="${DEPEND}"
BDEPEND=""
