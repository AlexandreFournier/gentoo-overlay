# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Spectrum analyzer for RTL-SDR (GUI for rtl_power based on PyQtGraph)"
HOMEPAGE="https://github.com/xmikos/qspectrumanalyzer"
SRC_URI="https://codeload.github.com/xmikos/${PN}/tar.gz/v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+rtl_power_fftw"

DEPEND="${PYTHON_DEPS}
	dev-python/PyQt4
	dev-python/pyqtgraph
	net-wireless/rtl-sdr
	rtl_power_fftw? ( net-wireless/rtl_power_fftw:= )"

RDEPEND="${DEPEND}"

