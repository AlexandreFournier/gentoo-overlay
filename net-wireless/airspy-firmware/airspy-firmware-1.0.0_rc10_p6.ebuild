# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="1.0.0-rc10-6"
MY_COMMIT="g4008185"
MY_P="airspy_fw_v${MY_PV}-${MY_COMMIT}"

DESCRIPTION="Firmware for the AirSpy SDR receiver"
HOMEPAGE="https://airspy.com/ https://github.com/airspy/airspyone_firmware"
SRC_URI="https://github.com/airspy/airspyone_firmware/releases/download/v${MY_PV}/${MY_P}.zip -> ${P}.zip"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="app-arch/unzip"

src_install() {
	insinto /usr/share/AirSpy
	newins airspy_rom_to_ram.bin airspy-fw-${MY_PV}.bin
}

pkg_postinst() {
	elog "Please remember you have to actually flash this onto"
	elog "your AirSpy with the following command:"
	elog "airspy_spiflash -w /usr/share/AirSpy/airspy-fw-${MY_PV}.bin"
}
