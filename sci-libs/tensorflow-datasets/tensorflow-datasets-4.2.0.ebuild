# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1

DESCRIPTION="A collection of datasets ready to use with TensorFlow"
HOMEPAGE="https://github.com/tensorflow/datasets"
SRC_URI="https://github.com/tensorflow/datasets/archive/v4.2.0.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/absl-py
	dev-python/attrs
	dev-python/numpy
	>=dev-python/protobuf-python-3.12.2
	dev-python/six
	sci-libs/tensorflow-metadata
	dev-python/termcolor
	dev-python/tqdm
	"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/datasets-"${PV}"
