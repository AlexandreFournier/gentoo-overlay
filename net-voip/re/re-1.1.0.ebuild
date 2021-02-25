# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Libre is a portable and generic library for real-time communications with async IO support and a complete SIP stack with support for SDP, RTP/RTCP, STUN/TURN/ICE, BFCP and DNS Client"
HOMEPAGE="http://www.creytiv.com/re.html"
SRC_URI="https://github.com/baresip/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr" LIBDIR="/usr/$(get_libdir)"
}
