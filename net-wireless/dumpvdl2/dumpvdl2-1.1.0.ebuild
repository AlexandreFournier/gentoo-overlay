# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A lightweight, standalone VDL Mode 2 message decoder and protocol analyzer"
HOMEPAGE="https://github.com/szpajder/dumpvdl2"
SRC_URI="https://github.com/szpajder/dumpvdl2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="rtlsdr mirisdr sdrplay"

DEPEND="
    rtlsdr? ( net-wireless/rtl-sdr )
    mirisdr? ( net-libs/libmirisdr )
    sdrplay? ( net-wireless/sdrplay )
"
RDEPEND="${DEPEND}"

src_compile() {
	emake \
		$(usex rtlsdr  WITH_RTLSDR=1  WITH_RTLSDR=0) \
		$(usex mirisdr WITH_MIRISDR=1 WITH_MIRISDR=0) \
		$(usex sdrplay WITH_SDRPLAY=1 WITH_SDRPLAY=0)
}

src_install() {
	dobin dumpvdl2
}
