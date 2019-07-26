# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Baresip is a portable and modular SIP User-Agent with audio and video support."
HOMEPAGE="http://creytiv.com/baresip.html"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alfredh/baresip.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/alfredh/${PN}/releases/download/v${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DEPEND="
	net-voip/re
	>=media-libs/rem-0.4.7"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's#/usr/local#/usr#g' Makefile
}
