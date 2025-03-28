# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12,13})

inherit cmake distutils-r1

DESCRIPTION="A Python package for simulator-independent specification of neuronal network models."
HOMEPAGE="https://neuralensemble.org/PyNN/"
SRC_URI="https://github.com/NeuralEnsemble/PyNN/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test brian neuron doc mpi"

DEPEND="dev-python/numpy
		dev-python/lazyarray
		dev-python/neo
		dev-python/quantities
		dev-python/morphio
		brian?( sci-libs/brian )
		neuron?( sci-libs/neuron )
		doc?( dev-python/sphinx )
		mpi?( dev-python/mpi4py )
		test?( dev-python/jinja
			   dev-python/pytest-conv
			   dev-python/flake8
			   dev-python/mpi4py
			   dev-python/scipy
			   dev-python/matplotlib
			   dev-python/cheetah3
			   dev-python/h5py)"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/PyNN-${PV}"

src_prepare() {
	default
	sed -i -e "s^cmake -Dwith-nest={} ../extensions^cmake -Dwith-nest={} -DCMAKE_INSTALL_PREFIX=${EPREFIX}/usr ../extensions^g" setup.py || die "Sed failed!"
	sed -i -e "s^make install^DESTDIR=${D} make install^g" setup.py || die "Sed failed!"
}
