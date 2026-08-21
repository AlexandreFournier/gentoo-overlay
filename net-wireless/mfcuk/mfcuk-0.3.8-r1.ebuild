# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="MiFare Classic Universal toolKit (MFCUK)"
HOMEPAGE="https://github.com/nfc-tools/mfcuk"
SRC_URI="https://github.com/nfc-tools/${PN}/archive/${P}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${P}"

LICENSE="GPL-2 GPL-2+ BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-libs/libnfc-1.7.0"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default

	eautoreconf
}
