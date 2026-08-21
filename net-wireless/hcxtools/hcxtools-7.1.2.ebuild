# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Portable solution for capturing wlan traffic and conversion to hashcat formats"
HOMEPAGE="https://github.com/ZerBea/hcxtools"
SRC_URI="https://github.com/ZerBea/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~x86"

RDEPEND="
	>=dev-libs/openssl-3.0.8:=
	net-misc/curl
	sys-libs/zlib:=
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README.md changelog )

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${ED}" PREFIX="${EPREFIX}/usr" install

	doman man/hcxtools.1
	einstalldocs
}
