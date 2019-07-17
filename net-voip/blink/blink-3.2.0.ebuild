# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=1

inherit eutils gnome2-utils distutils-r1

DESCRIPTION="A state of the art, easy to use SIP client"
HOMEPAGE="http://iCanBlink.com"
SRC_URI="https://github.com/AGProjects/${PN}-qt/archive/release-${PV}.tar.gz"

S="${WORKDIR}/${PN}-qt-release-${PV}"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

KEYWORDS="~amd64 ~x86"

CDEPEND="net-libs/libvncserver"
RDEPEND="${CDEPEND}
	>=dev-python/python-application-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/python-sipsimple-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-otr-1.2.0[${PYTHON_USEDEP}]
	dev-python/python-cjson[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-eventlib[${PYTHON_USEDEP}]
	dev-python/python-gnutls[${PYTHON_USEDEP}]
	dev-python/gmpy:2[${PYTHON_USEDEP}]
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/oauth2client[${PYTHON_USEDEP}]
	dev-python/PyQt5[svg,webkit,${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	virtual/python-enum34[${PYTHON_USEDEP}]
"
DEPEND="${CDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]"

src_compile() {
	python setup.py build_ext
}

src_install() {
	python setup.py install --home "${D}" --install-purelib="${D}"usr/lib64/python2.7/site-packages --install-platlib="${D}"usr/lib64/python2.7/site-packages --install-scripts="${D}"/usr/bin --install-data="${D}"usr

	newicon -s 48 resources/icons/blink48.png blink.png
	newicon -s 64 resources/icons/blink64.png blink.png
	doicon -s 512 resources/icons/blink.png

	make_desktop_entry ${PN} Blink
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
