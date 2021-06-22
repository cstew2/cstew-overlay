# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_7,3_8,3_9})

inherit distutils-r1

DESCRIPTION="A collection of datasets ready to use with TensorFlow"
HOMEPAGE="https://github.com/tensorflow/datasets"
SRC_URI="https://github.com/tensorflow/datasets/archive/v4.2.0.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/importlib_resources
	dev-python/absl-py
	dev-python/attrs
	dev-python/numpy
	>=dev-python/protobuf-python-3.12.2
	dev-python/six
	sci-libs/tensorflow_metadata
	dev-python/termcolor
	dev-python/tqdm
	"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/datasets-"${PV}"
