# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Bruteforce offline the WPS pin exploiting the low or non-existing entropy"
HOMEPAGE="https://github.com/wiire-a/pixiewps"
SRC_URI="https://github.com/wiire-a/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="openssl"

RDEPEND="openssl? ( dev-libs/openssl:= )"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md README.md )

src_compile() {
	emake CC="$(tc-getCC)" OPENSSL=$(usex openssl 1 0)
}

src_install() {
	emake DESTDIR="${ED}" PREFIX="${EPREFIX}/usr" install

	einstalldocs
}
