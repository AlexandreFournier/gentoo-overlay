# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A tool for reengineering 3rd party, closed, binary Android apps"
HOMEPAGE="https://apktool.org/ https://github.com/iBotPeaches/Apktool"
SRC_URI="https://github.com/iBotPeaches/Apktool/releases/download/v${PV}/${PN}_${PV}.jar -> ${P}.jar"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="tools"

RDEPEND="
	|| ( virtual/jre virtual/jdk )
	tools? ( dev-util/android-sdk-build-tools )
"

src_unpack() {
	cp -L "${DISTDIR}/${A}" "${S}/${PN}.jar" || die
}

src_install() {
	dobin "${FILESDIR}/apktool"
	insinto "/opt/${PN}"
	doins apktool.jar
}
