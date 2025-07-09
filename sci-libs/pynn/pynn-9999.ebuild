# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake distutils-r1

DESCRIPTION="A Python package for simulator-independent specification of neuronal network models."
HOMEPAGE="https://neuralensemble.org/PyNN/"
EGIT_REPO_URI="https://github.com/NeuralEnsemble/PyNN.git"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +brian +neuron doc mpi"

DEPEND="dev-python/numpy
		dev-python/lazyarray
		dev-python/neo
		dev-python/quantities
		dev-python/morphio
		brian? ( sci-libs/brian )
		neuron? ( sci-libs/neuron )
		doc? ( dev-python/sphinx )
		mpi? ( dev-python/mpi4py
			   virtual/mpi )
		test? ( dev-python/jinja2
			   dev-python/pytest-conv
			   dev-python/flake8
			   dev-python/mpi4py
			   dev-python/scipy
			   dev-python/matplotlib
			   dev-python/cheetah3
			   dev-python/h5py )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	default
	sed -i -e "s^cmake -Dwith-nest={} ../extensions^cmake -Dwith-nest={} -DCMAKE_INSTALL_PREFIX=${EPREFIX}/usr ../extensions^g" setup.py || die "Sed failed!"
	sed -i -e "s^make install^DESTDIR=${D} make install^g" setup.py || die "Sed failed!"
}
