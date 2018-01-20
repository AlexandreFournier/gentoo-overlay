# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MY_PV=${PV/_/-}

DESCRIPTION="AirSpy Firmware"
HOMEPAGE="http://www.airspy.com"
SRC_URI="https://github.com/airspy/firmware/releases/download/v${MY_PV}/airspy_fw_v${MY_PV}.zip -> ${P}.zip"
S="${WORKDIR}/airspy_fw_v${MY_PV}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/udev"
RDEPEND="${DEPEND}"

src_compile() {
	cp airspy_rom_to_ram.bin airspy-fw-${MY_PV}.bin
}

src_install() {
	insinto /usr/share/AirSpy
	doins airspy-fw-${MY_PV}.bin
}

pkg_postinst() {
	elog "Please remember you have to actually flash this onto"
	elog "your AirSpy with the following command:"
	elog "airspy_spiflash -w /usr/share/AirSpy/airspy-fw-${MY_PV}.bin"
}
