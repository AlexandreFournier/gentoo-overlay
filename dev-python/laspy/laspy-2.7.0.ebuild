# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python library for reading, modifying and creating LAS LiDAR files"
HOMEPAGE="https://pypi.org/project/laspy/ https://github.com/laspy/laspy"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 hppa ~ia64 ~mips x86"

RDEPEND="
	>=dev-python/lazrs-0.8.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pyproj[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"

# The sdist ships tests/, but pytest-benchmark and rangehttpserver are not
# packaged in ::gentoo
RESTRICT="test"
