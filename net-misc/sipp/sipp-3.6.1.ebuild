# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils cmake-utils

DESCRIPTION="SIPp is a tool to stress SIP server/proxy implementations."
HOMEPAGE="http://sipp.sourceforge.net/"
SRC_URI="https://github.com/SIPp/sipp/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="+gsl pcap sctp ssl"

PATCHES=( "${FILESDIR}/${P}-version-include-tar-55a128.patch" )

DEPEND=""
RDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DUSE_GSL="$(usex gsl ON OFF)"
		-DUSE_PCAP="$(usex pcap ON OFF)"
		-DUSE_SSL="$(usex ssl ON OFF)"
		-DUSE_SCTP="$(usex sctp ON OFF)"
	)
	cmake-utils_src_configure
}


