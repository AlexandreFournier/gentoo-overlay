# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit multilib

DESCRIPTION="Librem is a portable and generic library for real-time audio and video processing."
HOMEPAGE="http://creytiv.com/rem.html"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/baresip/${PN}.git"
	KEYWORDS="~x86 ~adm64"
else
	SRC_URI="https://github.com/baresip/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 amd64"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr" LIBDIR="/usr/$(get_libdir)"
}
