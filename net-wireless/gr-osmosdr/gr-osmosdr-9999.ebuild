# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit cmake-utils python-single-r1

DESCRIPTION="GNU Radio source block for OsmoSDR and rtlsdr and hackrf"
HOMEPAGE="http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://git.osmocom.org/${PN}"
	KEYWORDS=""
else
	#SRC_URI="http://cgit.osmocom.org/gr-osmosdr/snapshot/gr-osmosdr-${PV}.tar.xz"
	#git clone git://git.osmocom.org/gr-osmosdr.git
	#cd gr-osmosdr
	#git archive --format=tar --prefix=gr-osmosdr-${PV}/ v${PV} | xz > ../gr-osmosdr-${PV}.tar.xz
	SRC_URI="https://cgit.osmocom.org/gr-osmosdr/snapshot/gr-osmosdr-${PV}.tar.xz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="airspy bladerf fcd fcdpp hackrf iqbalance mirisdr python rtlsdr soapy sdrplay uhd"

RDEPEND="${PYTHON_DEPS}
	dev-libs/boost:=
	>=net-wireless/gnuradio-3.7_rc:0=[fcd?,${PYTHON_USEDEP}]
	airspy? ( net-wireless/airspy-host:= )
	bladerf? ( net-wireless/bladerf:= )
	fcdpp? ( net-wireless/gr-fcdproplus:= )
	hackrf? ( net-libs/libhackrf:= )
	iqbalance? ( net-wireless/gr-iqbal:=[${PYTHON_USEDEP}] )
	mirisdr? ( net-libs/libmirisdr:= )
	rtlsdr? ( >=net-wireless/rtl-sdr-0.5.4:= )
	sdrplay? ( net-wireless/sdrplay )
	soapy? ( net-wireless/soapysdr:= )
	uhd? ( net-wireless/uhd:=[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	dev-python/cheetah"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-fcdpp-support.diff"
	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DEFAULT=OFF
		-DPYTHON_EXECUTABLE="${PYTHON}"
		-DENABLE_FILE=ON
		-DENABLE_AIRSPY="$(usex airspy)"
		-DENABLE_BLADERF="$(usex bladerf)"
		-DENABLE_FCD="$(usex fcd)"
		-DENABLE_FCDPP="$(usex fcdpp)"
		-DENABLE_HACKRF="$(usex hackrf)"
		-DENABLE_IQBALANCE="$(usex iqbalance)"
		-DENABLE_MIRI="$(usex mirisdr)"
		-DENABLE_PYTHON="$(usex python)"
		-DENABLE_RTL="$(usex rtlsdr)"
		-DENABLE_RTL_TCP="$(usex rtlsdr)"
		-DENABLE_SOAPY="$(usex soapy)"
		-DENABLE_UHD="$(usex uhd)"
		-DENABLE_SDRPLAY="$(usex sdrplay)"
		-DENABLE_NONFREE="$(usex sdrplay)"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	if use python; then
		python_fix_shebang "${ED}"/usr/bin
	fi
}
