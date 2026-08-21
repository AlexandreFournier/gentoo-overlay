# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A lightweight, standalone VDL Mode 2 message decoder and protocol analyzer"
HOMEPAGE="https://github.com/szpajder/dumpvdl2"
SRC_URI="https://github.com/szpajder/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+rtlsdr sdrplay soapysdr sqlite zeromq"

RDEPEND="
	dev-libs/glib:2
	>=dev-libs/libacars-2.1.0
	rtlsdr? ( net-wireless/rtl-sdr )
	sdrplay? ( net-wireless/sdrplay )
	soapysdr? ( net-wireless/soapysdr )
	sqlite? ( dev-db/sqlite:3 )
	zeromq? ( net-libs/zeromq )
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		-DRTLSDR=$(usex rtlsdr ON OFF)
		-DSDRPLAY=$(usex sdrplay ON OFF)
		-DSDRPLAY3=OFF
		-DSOAPYSDR=$(usex soapysdr ON OFF)
		-DSQLITE=$(usex sqlite ON OFF)
		-DZMQ=$(usex zeromq ON OFF)
		# no libmirisdr and no statsdclient in ::gentoo
		-DMIRISDR=OFF
		-DETSY_STATSD=OFF
		-DPROFILING=OFF
	)

	cmake_src_configure
}
