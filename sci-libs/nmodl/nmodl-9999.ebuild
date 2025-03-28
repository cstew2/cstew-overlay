# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=(python3_{12,13})

inherit git-r3 cmake distutils-r1

DESCRIPTION="Code Generation Framework For NEURON MODeling Language"
HOMEPAGE="bluebrain.github.io/nmodl/"
EGIT_REPO_URI="https://github.com/BlueBrain/nmodl.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test +python"

DEPEND="python? ( dev-python/jinja
				  dev-python/pyyaml
				  dev-python/sympy )
		sys-devel/bison
		sys-devel/flex
		test? ( dev-python/pytest
				dev-python/pytest-cov
				dev-python/numpy
				dev-python/scipy
				sci-libs/neuron )"

RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	default
	local mycmakeargs=(
		-DNMODL_ENABLE_PYTHON_BINDINGS="$(usex python ON OFF)"
		-DLINK_AGAINST_PYTHON="$(usex python ON OFF)"
		-DNMODL_ENABLE_TESTS="$(usex test ON OFF)"
		-DNMODL_ENABLE_USECASES="$(usex test ON OFF)"
	)

	cmake_src_configure

	if use python ; then
		distutils-r1_src_configure
	fi
}

src_compile() {
	default
	cmake_src_compile

	if use python ; then
		distutils-r1_src_compile
	fi

}

src_install() {
	default
	cmake_src_install

	if use python ; then
		distutils-r1_src_install
	fi
}
