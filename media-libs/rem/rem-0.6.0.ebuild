# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib

DESCRIPTION="Librem is a portable and generic library for real-time audio and video processing."
HOMEPAGE="http://creytiv.com/rem.html"
SRC_URI="http://creytiv.com/pub/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr" LIBDIR="/usr/$(get_libdir)"
}
