# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1 bazel

bazel_external_uris=""

DESCRIPTION="Dataset, streaming, and file system extensions maintained by TensorFlow SIG-IO"
HOMEPAGE="https://github.com/tensorflow/io"
SRC_URI="https://github.com/tensorflow/io/archive/v${PV}.tar.gz
		${bazel_external_uris}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/protobuf-python[${PYTHON_USEDEP}]
		dev-python/googleapis-common-protos[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/metadata-"${PV}"

src_unpack() {
	bazel_load_distfiles "${bazel_external_uris}"
	default
}

src_prepare() {
	export JAVA_HOME=$(java-config --jre-home) # so keepwork works
	bazel_setup_bazelrc
	default
}

src_configure() {
	export JAVA_HOME=$(java-config --jre-home) # so keepwork works

	do_configure() {
		local SYSLIBS=(

		)
	}

	python_foreach_impl run_in_build_dir do_configure
}
