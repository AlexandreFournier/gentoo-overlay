# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="GNU radio Funcube Dongle Pro+ source"
HOMEPAGE="https://github.com/dl1ksv/gr-fcdproplus"

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/dl1ksv/gr-fcdproplus.git"
	EGIT_SOURCEDIR="${WORKDIR}/${PN}"
	KEYWORDS=""
	S="${WORKDIR}/${PN}"
else
	die "This software does not provide source package yet :("
fi

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=net-wireless/gnuradio-3.7[audio]
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_FLAGS=-ludev
		-DCMAKE_INSTALL_PREFIX="/usr"
		)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}

