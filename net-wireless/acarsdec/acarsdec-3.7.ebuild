# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An open source ACARS decoder with rtl_sdr frontend"
HOMEPAGE="https://github.com/TLeconte/acarsdec"
SRC_URI="https://github.com/TLeconte/${PN}/archive/${P}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="airspy mqtt +rtlsdr sndfile"
REQUIRED_USE="|| ( airspy rtlsdr )"

RDEPEND="
	airspy? ( net-wireless/airspy )
	mqtt? ( net-libs/paho-mqtt-c )
	rtlsdr? ( net-wireless/rtl-sdr )
	sndfile? ( media-libs/libsndfile )
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	# CMake 4 refuses a pre-3.5 minimum outright
	sed -i 's/cmake_minimum_required (VERSION 3.2)/cmake_minimum_required (VERSION 3.10)/' \
		CMakeLists.txt || die

	# do not force -Ofast and -march=native over the user's CFLAGS
	sed -i '/add_compile_options(-Ofast -march=native)/d' CMakeLists.txt || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-Dairspy=$(usex airspy ON OFF)
		-Drtl=$(usex rtlsdr ON OFF)
		-Dsdrplay=OFF
	)

	cmake_src_configure
}
