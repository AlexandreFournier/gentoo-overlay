# Copyright 2014-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/gkeys/gkeys-9999.ebuild,v 1.2 2014/12/25 20:58:50 dolsen Exp $

EAPI="5"

PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="SIP SIMPLE client SDK is a Software Development Kit"
HOMEPAGE="http://sipsimpleclient.org"
SRC_URI="https://github.com/AGProjects/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-release-${PV}"

CDEPEND="dev-python/twisted[${PYTHON_USEDEP}]"

DEPEND="${CDEPEND}"

RDEPEND="${CDEPEND}"
