# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="An open source Acars decoder with rtl_sdr frontend"
HOMEPAGE="https://github.com/TLeconte/acarsdec"
SRC_URI="https://github.com/TLeconte/${PN}/archive/${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-db/sqlite:3"
RDEPEND="${DEPEND}"

src_compile() {
	make
	make acarsserv
}

src_install() {
	dobin acarsdec
	dobin acarsserv
}
