# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Programmable debugger"
HOMEPAGE="https://github.com/osandov/drgn"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64"

