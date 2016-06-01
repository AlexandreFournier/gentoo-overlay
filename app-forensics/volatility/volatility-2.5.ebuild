# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Framework for analyzing volatile memory"
HOMEPAGE="http://www.volatilityfoundation.org/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/volatilityfoundation/${PN}.git"
else
	SRC_URI="https://github.com/volatilityfoundation/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=dev-libs/distorm64-3[${PYTHON_USEDEP}]
	dev-libs/libpcre
	dev-python/pycrypto[${PYTHON_USEDEP}]"

src_install() {
	distutils-r1_src_install
	mkdir "${D}/usr/share/${PN}"
	mv "${D}/usr/contrib/plugins" "${D}/usr/share/${PN}/"
	rmdir "${D}/usr/contrib"
	mv "${D}/usr/tools" "${D}/usr/share/${PN}/"
	dosym /usr/bin/vol.py /usr/bin/volatility
}
