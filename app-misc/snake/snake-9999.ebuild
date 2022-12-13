# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom snake-1.0-SNAPSHOT-204/pom.xml --download-uri https://github.com/bithatch/snake/archive/refs/tags/v1.0-SNAPSHOT-204.tar.gz --slot 0 --keywords "~amd64" --ebuild snake-1.0.204.ebuild

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="uk.co.bithatch:snake:1.0"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The parent module for all Snake modules."
HOMEPAGE="www.bithatch.co.uk"
SRC_URI="https://github.com/bithatch/${PN}/archive/refs/tags/v1.0-SNAPSHOT-204.tar.gz -> ${P}-sources.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-16:*
	dev-java/openjdk[javafx]"

RDEPEND="
	>=virtual/jre-16:*
"

S="${WORKDIR}"

JAVA_SRC_DIR=("${PN}-1.0-SNAPSHOT-204/snake-app-linux/src/main/java"
			   "${PN}-1.0-SNAPSHOT-204/snake-backend-openrazer/src/main/java"
			   "${PN}-1.0-SNAPSHOT-204/snake-lib/src/main/java"
			   "${PN}-1.0-SNAPSHOT-204/snake-ui/src/main/java"
			   "${PN}-1.0-SNAPSHOT-204/snake-ui-linux/src/main/java"
			   "${PN}-1.0-SNAPSHOT-204/snake-updater/src/main/java"
			   "${PN}-1.0-SNAPSHOT-204/snake-widgets/src/main/java")
