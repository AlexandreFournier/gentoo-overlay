# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A library for decoding ACARS message payloads"
HOMEPAGE="https://github.com/szpajder/libacars"
SRC_URI="https://github.com/szpajder/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+json +xml +zlib"

RDEPEND="
	json? ( dev-libs/jansson )
	xml? ( dev-libs/libxml2:= )
	zlib? ( sys-libs/zlib:= )
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		-DJANSSON=$(usex json ON OFF)
		-DLIBXML2=$(usex xml ON OFF)
		-DZLIB=$(usex zlib ON OFF)
	)

	cmake_src_configure
}
