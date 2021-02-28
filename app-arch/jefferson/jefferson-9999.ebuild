# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

inherit git-r3 distutils-r1

DESCRIPTION="JFFS2 filesystem extraction tool"
HOMEPAGE="https://github.com/sviehb/jefferson"
SRC_URI=""
EGIT_REPO_URI="https://github.com/sviehb/jefferson"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/cstruct"
RDEPEND="${DEPEND}"
