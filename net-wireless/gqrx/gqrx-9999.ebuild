# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Software defined radio receiver powered by GNU Radio and Qt5"
HOMEPAGE="http://gqrx.dk/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/csete/gqrx.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/csete/gqrx/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="qt4 qt5 pulseaudio"

DEPEND=">=net-wireless/gnuradio-3.7_rc:=[audio,analog,filter]
	>=net-wireless/gr-osmosdr-0.1.0:=
	dev-libs/boost:=
	qt4? (
		dev-qt/qtcore:4
		dev-qt/qtgui:4
		dev-qt/qtsvg:4
	)
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtsvg:5
		dev-qt/qtnetwork:5
	)
	pulseaudio? ( media-sound/pulseaudio:= )"

RDEPEND="${DEPEND}"

src_prepare() {
	if use !pulseaudio; then
		sed -i 's/LINUX_AUDIO_BACKEND Pulseaudio/LINUX_AUDIO_BACKEND Gr-audio/' CMakeLists.txt || die
	fi
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
