# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Library to read and edit ELF, PE, MachO, OAT files"
HOMEPAGE="https://scoding.de/filebytes-introduction"
SRC_URI="https://github.com/sashs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

