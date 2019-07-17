# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="SIP SIMPLE client SDK is a Software Development Kit"
HOMEPAGE="http://sipsimpleclient.org"
SRC_URI="https://github.com/AGProjects/${PN}/archive/release-${PV}.tar.gz"
S=${WORKDIR}/${PN}-release-${PV}

LICENSE="GPL-3"
SLOT="0"
IUSE="libressl"

KEYWORDS="~amd64 ~x86"

CDEPEND="
	dev-db/sqlite:3
	!libressl? ( dev-libs/openssl:0[-bindist] )
	libressl? ( dev-libs/libressl )
	dev-python/python-application[${PYTHON_USEDEP}]
	media-libs/alsa-lib
	media-libs/libv4l
	media-libs/libvpx
	sys-apps/util-linux
	virtual/ffmpeg
"
RDEPEND="${CDEPEND}
	virtual/python-dnspython[${PYTHON_USEDEP}]
	dev-python/python-cjson[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-eventlib[${PYTHON_USEDEP}]
	dev-python/greenlet[${PYTHON_USEDEP}]
	dev-python/python-gnutls[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/python-msrplib-0.19.0[${PYTHON_USEDEP}]
	dev-python/python-xcaplib[${PYTHON_USEDEP}]
	dev-python/twisted[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
DEPEND="${CDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	virtual/pkgconfig
"
src_compile() {
	chmod +x deps/pjsip/{a,}configure
	python setup.py build_ext
}

src_install() {
	python setup.py install --home "${D}" --install-purelib="${D}"usr/lib64/python2.7/site-packages --install-platlib="${D}"usr/lib64/python2.7/site-packages --install-scripts="${D}"/usr/bin --install-data="${D}"usr
}
