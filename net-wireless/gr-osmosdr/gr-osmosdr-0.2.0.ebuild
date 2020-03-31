# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_6 python3_7 )

inherit cmake-utils python-single-r1

DESCRIPTION="GNU Radio source block for OsmoSDR and rtlsdr and hackrf"
HOMEPAGE="http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://git.osmocom.org/${PN}"
	KEYWORDS=""
else
	SRC_URI="https://github.com/osmocom/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~x86 ~arm"
fi

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="airspy bladerf fcd -fcdpp hackrf iqbalance mirisdr python rtlsdr soapy sdrplay uhd"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-libs/boost:=
	>=net-wireless/gnuradio-3.8.0.0[${PYTHON_SINGLE_USEDEP}]
	airspy? ( net-wireless/airspy:= )
	bladerf? ( net-wireless/bladerf:= )
	fcdpp? ( net-wireless/gr-fcdproplus:=[${PYTHON_SINGLE_USEDEP}] )
	hackrf? ( net-libs/libhackrf:= )
	iqbalance? ( net-wireless/gr-iqbal:=[${PYTHON_SINGLE_USEDEP}] )
	mirisdr? ( net-libs/libmirisdr:= )
	rtlsdr? ( >=net-wireless/rtl-sdr-0.5.4:= )
	sdrplay? ( net-wireless/sdrplay )
	soapy? ( net-wireless/soapysdr:= )
	uhd? ( net-wireless/uhd:=[${PYTHON_SINGLE_USEDEP}] )"

DEPEND="${RDEPEND}
	$(python_gen_useflags 'python2*')? ( dev-python/cheetah )"

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.2.0-fix-fcdpp-support.diff"
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
