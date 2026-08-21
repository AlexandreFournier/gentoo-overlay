# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Utility functions for OsmocomBB, OpenBSC and related projects"
HOMEPAGE="https://osmocom.org/projects/libosmocore"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitea.osmocom.org/osmocom/${PN}.git"
else
	SRC_URI="https://github.com/osmocom/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm ~x86"
fi

LICENSE="GPL-2 LGPL-3"
SLOT="0"
IUSE="doc pcsc-lite systemd +uring usb"

RDEPEND="
	net-libs/gnutls:=
	net-libs/libmnl
	net-misc/lksctp-tools
	sys-libs/talloc
	pcsc-lite? ( sys-apps/pcsc-lite )
	systemd? ( sys-apps/systemd:= )
	uring? ( sys-libs/liburing:= )
	usb? ( virtual/libusb:1 )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	doc? ( app-text/doxygen )
"

src_prepare() {
	default

	# release tarballs carry no git metadata, so the version would otherwise
	# be substituted as UNKNOWN in the pkgconfig files
	sed -i "s/UNKNOWN/${PV}/" git-version-gen || die

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable doc doxygen) \
		$(use_enable pcsc-lite pcsc) \
		$(use_enable systemd systemd-logging) \
		$(use_enable uring) \
		$(use_enable usb libusb)
}
