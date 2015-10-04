# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="TETRA speech codec (ETSI EN 300 395-2)"
HOMEPAGE="http://www.etsi.org/technologies-clusters/technologies/tetra"
SRC_URI="http://www.etsi.org/deliver/etsi_en/300300_300399/30039502/01.03.01_60/en_30039502v010301p0.zip"

LICENSE="ETSI"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir ${P}
	unzip -L ${DISTDIR}/${A} -d ${P} || die
}

src_prepare() {
	epatch ${FILESDIR}/osmocom-tetra-and-sq5bpf-optimizations.diff
}

src_compile() {
	emake CC="$(tc-getCC)" -C c-code
}

src_install() {
    exeinto /usr/bin
	doexe c-code/ccoder || die
	doexe c-code/cdecoder || die
	doexe c-code/scoder || die
	doexe c-code/sdecoder || die
}
