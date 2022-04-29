# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit cmake distutils-r1

DESCRIPTION="A Python package for simulator-independent specification of neuronal network models."
HOMEPAGE="https://neuralensemble.org/PyNN/"
SRC_URI="https://github.com/NeuralEnsemble/PyNN/archive/refs/tags/0.10.0.tar.gz -> ${P}.tar.gz"
LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/jinja
		dev-python/docutils
		dev-python/mock
		dev-python/numpy
		dev-python/quantities
		dev-python/lazyarray
		dev-python/neo
		dev-python/nose
		dev-python/h5py
		sci-libs/brian
		sci-libs/nest"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/PyNN-${PV}"

src_prepare() {
	default
	sed -i -e "s^cmake -Dwith-nest={} ../extensions^cmake -Dwith-nest={} -DCMAKE_INSTALL_PREFIX=${EPREFIX}/usr ../extensions^g" setup.py || die "Sed failed!"
	sed -i -e "s^make install^DESTDIR=${D} make install^g" setup.py || die "Sed failed!"
}
