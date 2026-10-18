# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2

DESCRIPTION="MCP Extension for Ghidra"
HOMEPAGE="https://github.com/LaurieWired/GhidraMCP"
SRC_URI="https://github.com/LaurieWired/GhidraMCP/archive/refs/tags/2.0.tar.gz ->  ${P}.tar.gz"

LICENSE="Apache2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=virtual/jdk-21
		dev-util/ghidra
		app-arch/unzip"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/GhidraMCP-${PV}"

check_gradle_binary() {
	gradle_link_target=$(readlink -n ${EPREFIX}/usr/bin/gradle)
	currentver="${gradle_link_target/gradle-bin-/}"
	requiredver="${GRADLE_VER}"
	einfo "Gradle version ${currentver} currently set."
	if [ "$(echo ${currentver} | cut -d. -f1)" -ge "9" ]; then
		eerror "Selected gradle version ${currentver} is too high. It must be eselected before building ${PN}."
		die "Please run 'eselect gradle set gradle-bin-XX' when XX is a version of gradle lower than 9."
	elif [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then
		einfo "Gradle version ${currentver} is >= ${requiredver}, proceeding with build..."
	else
		eerror "Gradle version ${requiredver} or higher must be eselected before building ${PN}."
		die "Please run 'eselect gradle set gradle-bin-XX' when XX is a version of gradle higher than ${requiredver}"
	fi
}

src_compile() {
	check_gradle_binary

	export GHIDRA_INSTALL_DIR="${EPREFIX}/usr/share/ghidra"
	export _JAVA_OPTIONS="${_JAVA_OPTIONS} -Duser.home=${T} -Djava.io.tmpdir=${T}"

	gradle \
		--gradle-user-home "${T}/gradle-home" \
		--console rich \
		--no-daemon \
		--offline \
		--max-workers "$(nproc)" \
		-p "${S}/extension" \
		buildExtension || die "GhidraMCP extension build failed"
}

src_install() {
	local stage="${T}/ghidramcp-extension"

	mkdir -p "${stage}" || die
	unzip -q "${S}"/extension/dist/*_GhidraMCP.zip \
		  -d "${stage}" ||
		die "Failed to extract GhidraMCP extension"

	insinto "${EPREFIX}/usr/share/ghidra/Ghidra/Extensions"
	doins -r "${stage}"/*
}
