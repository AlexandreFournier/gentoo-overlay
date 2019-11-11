# Copyright 2014-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/gkeys/gkeys-9999.ebuild,v 1.2 2014/12/25 20:58:50 dolsen Exp $

EAPI="5"

PYTHON_COMPAT=(python3_{2,3,4,5,6,7} pypy{,3})

inherit distutils-r1

DESCRIPTION="API For huawei LAN/WAN LTE Modems"
HOMEPAGE="https://github.com/Salamek/huawei-lte-api"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
IUSE="test"

KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/dicttoxml[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_prepare_all() {
	# Disable unconditional dependency on dev-python/pytest-runner.
	sed -i -e "s|'pytest-runner'||g" setup.py || die
}
