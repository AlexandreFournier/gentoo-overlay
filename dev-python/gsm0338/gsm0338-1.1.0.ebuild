# Copyright 2021-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry-core
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="GSM 03.38 codec"
HOMEPAGE="https://pypi.org/project/gsm0338/ https://github.com/dsch/gsm0338"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
