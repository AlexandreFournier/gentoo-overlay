# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit cmake-utils python-single-r1

DESCRIPTION="GNU radio Funcube Dongle Pro+ source"
HOMEPAGE="https://github.com/dl1ksv/gr-fcdproplus"

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/dl1ksv/gr-fcdproplus.git"
	EGIT_SOURCEDIR="${WORKDIR}/${PN}"
	S="${WORKDIR}/${PN}"
	KEYWORDS="~amd64"
else
	SRC_URI="https://github.com/dl1ksv/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	>=net-wireless/gnuradio-3.7[audio]
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

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

