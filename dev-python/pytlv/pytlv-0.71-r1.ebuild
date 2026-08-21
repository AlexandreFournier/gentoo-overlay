# Copyright 2021-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="TLV data parser, especially useful for EMV tags parsing"
HOMEPAGE="https://pypi.org/project/pytlv/ https://github.com/timgabets/pytlv"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 ~x86"

# pytlv/tests.py still uses Python 2 implicit relative imports
RESTRICT="test"
