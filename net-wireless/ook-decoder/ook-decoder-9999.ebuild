# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="On-Off Keying radio decoder"
HOMEPAGE="https://github.com/jimstudt/ook-decoder"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/jimstudt/ook-decoder.git"
	inherit git-r3
	KEYWORDS=""
else
	eerror
	eerror "There is no release numbering for this project"
	eerror
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	sed -i 's!-D_DARWIN_C_SOURCE=1 !!' Makefile
	sed -i 's!-D_BSD_SOURCE=1!-D_DEFAULT_SOURCE=1!' Makefile
}

src_compile() {
	emake daemon clients
}

src_install() {
	mkdir -p ${D}/usr/bin
	emake PREFIX="${D}/usr" install
}

