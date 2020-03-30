# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_6 python3_7 )
inherit python-single-r1 cmake-utils

DESCRIPTION="Set of tools for receiving information transmitted by GSM equipment/devices"
HOMEPAGE="https://github.com/osmocom/gr-gsm"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/osmocom/gr-gsm.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/osmocom/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~x86 ~arm"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="doc"

RDEPEND="
	dev-libs/boost
	dev-util/cppunit
	net-libs/libosmocore
	net-wireless/gnuradio[${PYTHON_SINGLE_USEDEP}]
	virtual/libusb"

DEPEND="${RDEPEND}
	dev-lang/swig"

src_prepare() {
	epatch "${FILESDIR}/${P}-gnuradio-3.8.patch"

	sed -i "s|gr-grgsm|gr-gsm|g" CMakeLists.txt
#fixme below
	sed -i "s|\${GR_DOC_DIR}\/\${CMAKE_PROJECT_NAME}|${EPREFIX}/usr/share/doc/${PF}|g" CMakeLists.txt
}

#Fixme: GR_PKG_DOC_DIR is not getting set
#		-DGR_PKG_DOC_DIR="${EPREFIX}/usr/share/doc/${PF}"
src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_enable doc DOXYGEN) \
	)
	cmake-utils_src_configure
}
