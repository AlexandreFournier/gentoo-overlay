# Copyright 2015 Alexandre Fournier
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Offline radio signal analyser"
HOMEPAGE="https://github.com/miek/inspectrum"
SRC_URI="https://github.com/miek/${PN}/archive/v${PV}.zip"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/miek/${PN}.git"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-qt/qtcore:5
	sci-libs/fftw"
DEPEND="${RDEPEND}"

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
