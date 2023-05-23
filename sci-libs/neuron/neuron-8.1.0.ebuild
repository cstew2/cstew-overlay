# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit cmake

DESCRIPTION="NEURON is a simulation environment for modeling individual neurons and networks of neurons."
HOMEPAGE="https://neuron.yale.edu/neuron/"
SRC_URI="https://github.com/neuronsimulator/nrn/archive/refs/tags/8.1.0.tar.gz -> ${PV}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/mpi4py
		dev-python/scipy
		dev-python/numpy
		dev-python/bokeh
		dev-python/matplotlib
		dev-python/scikit-build
		dev-python/cython
		sys-devel/bison
		sys-devel/flex
		virtual/mpi"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/nrn-${PV}"
