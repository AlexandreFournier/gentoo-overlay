# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Power spectrum for RTLSDR dongles"
HOMEPAGE="https://github.com/AD-Vega/rtl-power-fftw"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/AD-Vega/rtl-power-fftw.git"
	inherit git-r3
	KEYWORDS=""
else
	eerror
	eerror "There is no release numbering for this project"
	eerror
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-wireless/rtl-sdr dev-cpp/tclap"
RDEPEND="${DEPEND}"
