# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="MiFare Classic Universal toolKit (MFCUK)"
HOMEPAGE="https://github.com/nfc-tools/mfcuk"
SRC_URI="https://github.com/nfc-tools/${PN}/archive/${P}.tar.gz"

LICENSE="GPL-2 GPL-2+ BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-libs/libnfc-1.7.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	default
	eautoreconf
}
