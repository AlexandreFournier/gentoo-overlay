# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Utility functions for OsmocomBB, OpenBSC and related projects"
HOMEPAGE="http://bb.osmocom.org/trac/wiki/libosmocore"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.osmocom.org/${PN}.git"
	KEYWORDS=""
else
    SRC_URI="https://github.com/osmocom/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="amd64 ~x86 ~arm"
fi

LICENSE="GPL-2 LGPL-3"
SLOT="0"
IUSE="pcsc-lite"

RDEPEND="
	sys-libs/talloc
	net-misc/lksctp-tools
	net-libs/gnutls
	pcsc-lite? ( sys-apps/pcsc-lite )
"

DEPEND="${RDEPEND}
	app-doc/doxygen
"

src_prepare() {
	default_src_prepare
	# set correct version in pkgconfig files
	sed -i "s/UNKNOWN/${PV}/" git-version-gen || die

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable pcsc-lite pcsc)
}
