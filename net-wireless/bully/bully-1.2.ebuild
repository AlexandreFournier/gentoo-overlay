# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A wifi-protected-setup (WPS) brute force attack tool, similar to reaver"
HOMEPAGE="https://github.com/aanarchyy/bully"
SRC_URI="https://github.com/aanarchyy/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+ GPL-2 BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

RDEPEND="net-libs/libpcap"
DEPEND="${RDEPEND}"

DOCS=( README.md )

src_compile() {
	emake -C src CC="$(tc-getCC)"
}

src_install() {
	emake -C src DESTDIR="${D}" prefix=/usr install

	einstalldocs
}
