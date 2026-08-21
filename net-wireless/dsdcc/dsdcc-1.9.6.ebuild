# Copyright 2020-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Digital Speech Decoder (DSD) rewritten as a C++ library"
HOMEPAGE="https://github.com/f4exb/dsdcc"
SRC_URI="https://github.com/f4exb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="+mbelib serialdv"

RDEPEND="
	mbelib? ( media-libs/mbelib )
	serialdv? ( dev-libs/serialDV )
"
DEPEND="${RDEPEND}"

src_prepare() {
	# upstream still declares a pre-3.10 minimum, which CMake 4 warns about
	sed -i 's/cmake_minimum_required(VERSION 3.5)/cmake_minimum_required(VERSION 3.10)/' \
		CMakeLists.txt || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_MBELIB=$(usex mbelib ON OFF)
	)

	cmake_src_configure
}
