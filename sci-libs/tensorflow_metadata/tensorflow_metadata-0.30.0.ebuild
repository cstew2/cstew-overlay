# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python{3_7,3_8,3_9})

inherit distutils-r1 bazel

bazel_external_uris="https://github.com/protocolbuffers/protobuf/archive/310ba5ee72661c081129eb878c1bbcec936b20f0.tar.gz -> protobuf-310ba5ee72661c081129eb878c1bbcec936b20f0.tar.gz"

DESCRIPTION="Utilities for passing TensorFlow-related metadata between tools"
HOMEPAGE="https://github.com/tensorflow/metadata"
SRC_URI="https://github.com/tensorflow/metadata/archive/v${PV}.tar.gz
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
			absl_py
			com_google_protobuf
		)
	}

	python_foreach_impl run_in_build_dir do_configure
}
