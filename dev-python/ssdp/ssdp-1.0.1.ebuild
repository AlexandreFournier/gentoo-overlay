# Copyright 2014-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/gkeys/gkeys-9999.ebuild,v 1.2 2014/12/25 20:58:50 dolsen Exp $

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Python asyncio library for Simple Service Discovery Protocol (SSDP)"
HOMEPAGE="https://github.com/codingjoe/ssdp"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
IUSE=""

KEYWORDS="amd64 ~x86"

CDEPEND=""
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

