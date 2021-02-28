# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

PY_PN=ovh
PY_P=${PY_PN}-${PV}

DESCRIPTION="Lightweight wrapper around OVH's APIs"
HOMEPAGE="http://api.ovh.com/"
SRC_URI="mirror://pypi/${PY_PN:0:1}/${PY_PN}/${PY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

S="${WORKDIR}/${PY_P}"
