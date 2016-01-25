# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="Decode several 433.92MHz sensors using librtlsdr"
HOMEPAGE="https://github.com/merbanan/rtl_433"
EGIT_REPO_URI="https://github.com/merbanan/rtl_433.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="net-wireless/rtl-sdr"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

