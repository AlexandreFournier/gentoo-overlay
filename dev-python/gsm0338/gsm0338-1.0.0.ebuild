# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="GSM 03.38 codec"
HOMEPAGE="https://pypi.org/project/gsm0338/ https://github.com/dsch/gsm0338"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND="
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]"

src_prepare(){
	rm -rf test
	eapply_user
}

