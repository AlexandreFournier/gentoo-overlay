# Copyright 2020-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast GF(256) Cauchy MDS Block Erasure Codec in C++"
HOMEPAGE="https://github.com/f4exb/cm256cc"
SRC_URI="https://github.com/f4exb/cm256cc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

PATCHES=(
	# Upstream still declares a pre-3.10 minimum, which CMake 4 warns about
	"${FILESDIR}/${P}-cmake-minimum-required.patch"
)
