# Copyright 2022-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Digital Speech Decoder"
HOMEPAGE="https://github.com/szechyjs/dsd"
EGIT_REPO_URI="https://github.com/szechyjs/dsd.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="portaudio"

RDEPEND="
	media-libs/libsndfile
	media-libs/mbelib
	sci-libs/itpp
	portaudio? ( media-libs/portaudio )
"
DEPEND="${RDEPEND}"

src_prepare() {
	# CMake 4 refuses a pre-3.5 minimum outright
	sed -i 's/cmake_minimum_required(VERSION 2.8.11)/cmake_minimum_required(VERSION 3.10)/' \
		CMakeLists.txt || die

	cmake_src_prepare
}
