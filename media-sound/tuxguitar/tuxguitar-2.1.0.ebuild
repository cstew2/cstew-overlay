# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3 xdg

DESCRIPTION="TuxGuitar is a multitrack guitar tablature editor and player written in Java-SWT"
HOMEPAGE="https://www.tuxguitar.app/ https://github.com/helge17/tuxguitar"
EGIT_REPO_URI="https://github.com/helge17/tuxguitar.git"
EGIT_COMMIT="2.1.0"

# Upstream currently tracks Eclipse SWT 4.37
SWT_VERSION="4.37"
SWT_URI="https://download.eclipse.org/eclipse/downloads/drops4/R-${SWT_VERSION}-202509050730/swt-${SWT_VERSION}-gtk-linux-x86_64.zip"

SRC_URI="amd64? ( ${SWT_URI} -> swt-${SWT_VERSION}-gtk-linux-x86_64.zip )"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="alsa fluidalsa fluidjack fluidsdl fluidoss fluidpipewire fluidportaudio fluidpulseaudio fluidsynth html jack lv2 oss timidity"

KEYWORDS="~amd64"
RESTRICT="network-sandbox"

CDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3
	alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )
	fluidsynth? ( media-sound/fluidsynth )
	fluidalsa? ( media-sound/fluidsynth[alsa] )
	fluidjack? ( media-sound/fluidsynth[jack] )
	fluidsdl? ( media-sound/fluidsynth[sdl] )
	fluidoss? ( media-sound/fluidsynth[oss] )
	fluidpipewire? ( media-sound/fluidsynth[pipewire] )
	fluidportaudio? ( media-sound/fluidsynth[portaudio] )
	fluidpulseaudio? ( media-sound/fluidsynth[pulseaudio] )
	lv2? (
		media-libs/lilv
		media-libs/suil
		dev-qt/qtbase:6[gui,widgets]
		dev-qt/qt5compat:6
	)
	html? ( >=net-libs/webkit-gtk-2.42:4.1 )
"

RDEPEND="
	>=virtual/jre-17
	media-sound/fluid-soundfont
	timidity? (
		alsa? ( media-sound/timidity++[alsa] )
		oss? ( media-sound/timidity++[oss] )
		media-sound/timidity++
	)
	${CDEPEND}
"

DEPEND="
	>=virtual/jdk-17
	virtual/pkgconfig
	${CDEPEND}
"

BDEPEND="
	${DEPEND}
	app-arch/unzip
	dev-java/maven-bin
"

BUILDSCRIPTD="desktop/build-scripts/tuxguitar-linux-swt"
TARGETD="target/tuxguitar-9.99-SNAPSHOT-linux-swt"

pkg_pretend() {
	if use fluidsynth; then
		local i=0
		use fluidalsa && ((i++))
		use fluidjack && ((i++))
		use fluidsdl && ((i++))
		use fluidoss && ((i++))
		use fluidpipewire && ((i++))
		use fluidportaudio && ((i++))
		use fluidpulseaudio && ((i++))
		if [[ ${i} -ge 2 || ${i} -eq 0 ]] ; then
			eerror "When USE=fluidsynth is set, you must select EXACTLY one audio backend USE flag:"
			eerror "fluidalsa, fluidjack, fluidsdl, fluidoss, fluidpipewire, fluidportaudio, or fluidpulseaudio"
			die "Invalid fluidsynth backend USE configuration."
		fi
	fi
}

src_unpack() {
	# Pull git repository
	git-r3_src_unpack

	# Unpack SWT artifact for maven local cache
	if use amd64 ; then
		mkdir -p "${WORKDIR}/swt-${SWT_VERSION}" || die "mkdir swt failed"
		cd "${WORKDIR}/swt-${SWT_VERSION}" || die "cd swt failed"
		unpack "swt-${SWT_VERSION}-gtk-linux-x86_64.zip"
	fi

	mkdir -p "${WORKDIR}/.m2/repository" || die "mkdir m2 failed"
	if [[ -f "${FILESDIR}/settings.xml" ]]; then
		cp "${FILESDIR}/settings.xml" "${WORKDIR}/.m2/repository/settings.xml" || die "cp settings.xml failed"
		sed -i -e "s:/home/dom/softs/Gentoo/TuxGuitar/.m2:${WORKDIR}/.m2/repository:" \
			"${WORKDIR}/.m2/repository/settings.xml" || die "sed settings.xml failed"
	fi
}

src_prepare() {
	default

	# Point default soundbank configs at the installed system soundfont
	# (media-sound/fluid-soundfont) instead of the bundled-but-never-shipped
	# MagicSFver2.sf2. Covers all known config files upstream ships this in;
	# missing files are skipped rather than failing, since upstream layout
	# has moved before.
	local sf_cfg
	for sf_cfg in \
		desktop/TuxGuitar-synth-gervill/share/tuxguitar-synth-gervill.cfg \
		desktop/build-scripts/common-resources/common-linux/dist/tuxguitar-fluidsynth.cfg \
		desktop/build-scripts/common-resources/common/dist/tuxguitar-jsa.cfg
	do
		if [[ -f "${sf_cfg}" ]]; then
			sed -i \
				-e 's|\${tuxguitar\.home\.path}/share/soundfont/MagicSFver2\.sf2|/usr/share/sounds/sf2/FluidR3_GM.sf2|' \
				"${sf_cfg}" || die "Failed to patch soundfont path in ${sf_cfg}"
		fi
	done
	# Strip native backend modules (and their packaging <copy> blocks) for
	# any backend whose USE flag is disabled, so the Maven build doesn't
	# unconditionally require dev headers/libs for backends we didn't ask
	# for. Mirrors the existing lv2 handling below.
	local swt_pom="desktop/build-scripts/tuxguitar-linux-swt/pom.xml"
	local pair flag mod
	for pair in alsa:tuxguitar-alsa-linux jack:tuxguitar-jack-linux fluidsynth:tuxguitar-fluidsynth-linux; do
		flag="${pair%%:*}"
		mod="${pair##*:}"
		if ! use "${flag}"; then
			sed -i "/<module>\.\.\/native-modules\/${mod}<\/module>/d" \
				"${swt_pom}" || die "Failed to strip ${mod} module"

			awk -v mod="${mod}" '
				/<copy todir=/ { buf=$0; incopy=1; skip=0; next }
				incopy && /<fileset dir=/ {
					buf = buf "\n" $0
					if (index($0, mod) > 0) skip=1
					next
				}
				incopy && /<\/copy>/ {
					buf = buf "\n" $0
					if (!skip) print buf
					incopy=0
					next
				}
				{ print }
			' "${swt_pom}" > "${swt_pom}.tmp" \
				&& mv "${swt_pom}.tmp" "${swt_pom}" \
				|| die "Failed to strip ${mod} copy block"
		fi
	done
	# If USE="-lv2", strip module from reactor and create dummy build directory for Ant copy task
	if ! use lv2; then
		sed -i '/<module>.*lv2.*<\/module>/d' \
			desktop/build-scripts/tuxguitar-linux-swt/pom.xml || die "Failed to strip LV2 module from pom.xml"

		# Create the expected build dir so antrun:copy doesn't abort
		mkdir -p desktop/build-scripts/native-modules/tuxguitar-synth-lv2-linux/target/build || die "mkdir failed"

		# The final packaging module (tuxguitar-linux-swt) has a separate
		# antrun chmod task that unconditionally targets lv2-client/*.bin.
		# With the lv2 module excluded, that directory never gets created,
		# and Ant's <chmod> throws instead of silently matching nothing.
		# Strip that one chmod line so the build doesn't die on it.
		sed -i '/<chmod[^>]*lv2-client/d' \
			desktop/build-scripts/tuxguitar-linux-swt/pom.xml \
			|| die "Failed to strip lv2-client chmod task"
	else
		# Patch Qt6 flags in native Makefiles for LV2
		local mk
		while IFS= read -r -d '' mk; do
			einfo "Configuring Qt6 flags in: ${mk}"
			sed -i \
				-e 's/Qt5Widgets Qt5Core/Qt6Widgets Qt6Core Qt6Core5Compat/g' \
				-e 's/`pkg-config Qt5Core --cflags`/`pkg-config --cflags Qt6Core Qt6Core5Compat`/g' \
				-e 's/`pkg-config Qt5Widgets --cflags`/`pkg-config --cflags Qt6Widgets`/g' \
				-e 's/`pkg-config Qt5Core --libs`/`pkg-config --libs Qt6Core Qt6Core5Compat`/g' \
				-e 's/`pkg-config Qt5Widgets --libs`/`pkg-config --libs Qt6Widgets`/g' \
				-e 's/g++/g++ -std=c++17/g' \
				"${mk}" || die "Failed to configure Qt in ${mk}"
		done < <(find "${S}" -type f \( -name "GNUmakefile" -o -name "Makefile" \) -print0)
	fi
}
src_compile() {
	local m2_settings=()
	if [[ -f "${WORKDIR}/.m2/repository/settings.xml" ]]; then
		m2_settings=(-s "${WORKDIR}/.m2/repository/settings.xml")
	fi

	if use amd64 ; then
		cd "${WORKDIR}/swt-${SWT_VERSION}" || die "cd swt failed"
		mvn install:install-file "${m2_settings[@]}" \
			-Dfile=swt.jar \
			-DgroupId=org.eclipse.swt \
			-DartifactId=org.eclipse.swt.gtk.linux \
			-Dpackaging=jar \
			-Dversion="${SWT_VERSION}" || die "mvn install swt failed"
	fi

	cd "${S}/${BUILDSCRIPTD}" || die "cd build script failed"

	local mvn_args=(
		-e clean verify
		-P native-modules
		-DskipTests
		"${m2_settings[@]}"
	)

	ewarn "Running Maven verification..."
	mvn "${mvn_args[@]}" || die "mvn failed"

	cd "${S}" || die "cd S failed"
	sed -i -e "s:Icon=.*:Icon=tuxguitar:" \
		"${BUILDSCRIPTD}/${TARGETD}"/share/applications/TuxGuitar.desktop || die "sed desktop failed"

	rm -f "${BUILDSCRIPTD}/${TARGETD}"/doc/INSTALL.md \
		"${BUILDSCRIPTD}/${TARGETD}"/doc/LICENSE || die "rm docs failed"

	local driverf="${BUILDSCRIPTD}/${TARGETD}/dist/tuxguitar-fluidsynth.cfg"
	if [[ -f "${driverf}" ]]; then
		if use fluidalsa; then sed -i -e "s:pulseaudio:alsa:" "${driverf}" || die ; fi
		if use fluidjack; then sed -i -e "s:pulseaudio:jack:" "${driverf}" || die ; fi
		if use fluidsdl; then sed -i -e "s:pulseaudio:sdl2:" "${driverf}" || die ; fi
		if use fluidoss; then sed -i -e "s:pulseaudio:oss:" "${driverf}" || die ; fi
		if use fluidpipewire; then sed -i -e "s:pulseaudio:pipewire:" "${driverf}" || die ; fi
		if use fluidportaudio; then sed -i -e "s:pulseaudio:portaudio:" "${driverf}" || die ; fi
	fi
}

src_install() {
	cd "${S}/${BUILDSCRIPTD}/${TARGETD}" || die "cd install dir failed"

	insinto /usr/share/tuxguitar
	doins tuxguitar.sh
	doins -r dist
	doins -r share/help
	doins -r share/lang
	doins -r lib
	[[ -d lv2-client ]] && doins -r lv2-client
	doins -r share/plugins
	doins -r share/scales
	doins -r share/skins
	doins -r share/templates
	doins -r share/tunings

	insinto /usr/share/sounds/sf2
	[[ -d share/soundfont ]] && doins share/soundfont/*.sf2

	insinto /usr/share
	doins -r share/applications
	doins -r share/man
	doins -r share/mime
	doins -r share/pixmaps

	if [[ -f "${FILESDIR}/tuxguitar" ]]; then
		insopts -m 755
		dobin "${FILESDIR}/tuxguitar"
	else
		# Generate a basic wrapper if no custom binary script is in FILESDIR
		newbin tuxguitar.sh tuxguitar
	fi

	dodoc -r doc/*
	einstalldocs
}
