# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="WLAN tools for bruteforcing 802.11 WPA/WPA2 keys"
HOMEPAGE="https://github.com/joswr1ght/cowpatty"
SRC_URI="https://github.com/joswr1ght/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-libs/openssl:=
	net-libs/libpcap
"
DEPEND="${RDEPEND}"

src_compile() {
	# the Makefile hardcodes CC and CFLAGS, and links with CFLAGS rather
	# than LDFLAGS; overriding on the command line is the only way in
	emake -j1 CC="$(tc-getCC)" CFLAGS="${CFLAGS} ${LDFLAGS} -DOPENSSL"
}

src_install() {
	dobin cowpatty genpmk
	doman cowpatty.1 genpmk.1

	# globbed here rather than in a global DOCS, which would be expanded
	# during the depend phase, outside ${S}
	dodoc AUTHORS CHANGELOG FAQ INSTALL README TODO dict *.dump
}
