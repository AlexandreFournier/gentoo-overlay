# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker udev

DESCRIPTION="SDRplay binary library (RSP1/RSP2)"
HOMEPAGE="http://www.sdrplay.com"
SRC_URI="http://www.sdrplay.com/software/SDRplay_RSP_API-Linux-${PV}.run"

LICENSE="SDRplay"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="bindist"

DEPEND="virtual/udev"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack_makeself SDRplay_RSP_API-Linux-${PV}.run
}

src_compile() {
    # ln -s libmirsdrapi-rsp.so.2.10 i686/libmirsdrapi-rsp.so || die
    # ln -s libmirsdrapi-rsp.so.2.10 i686/libmirsdrapi-rsp.so.2 || die

    ln -s libmirsdrapi-rsp.so.2.10 x86_64/libmirsdrapi-rsp.so || die
    ln -s libmirsdrapi-rsp.so.2.10 x86_64/libmirsdrapi-rsp.so.2 || die
}

src_install() {
	insinto /usr/include
	doins mirsdrapi-rsp.h

	# dolib.so i686/libmirsdrapi-rsp.so.2.10
	# echo dolib.so i686/libmirsdrapi-rsp.so.2
	# echo dolib.so i686/libmirsdrapi-rsp.so

	dolib.so x86_64/libmirsdrapi-rsp.so.2.10
	dolib.so x86_64/libmirsdrapi-rsp.so.2
	dolib.so x86_64/libmirsdrapi-rsp.so

	udev_newrules 66-mirics.rules 66-mirics-sdrplay.rules
}
