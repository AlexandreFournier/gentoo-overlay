# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Python pcap extension"
HOMEPAGE="http://oss.coresecurity.com/projects/pcapy.html"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	http://oss.coresecurity.com/repo/${P}.tar.gz"

LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="${DEPEND}
	net-libs/libpcap"

