# Copyright 2021-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="The bidirectional mapping library for Python"
HOMEPAGE="https://pypi.org/project/bidict/ https://github.com/jab/bidict"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"

# pypi tarball does not contain tests
RESTRICT="test"
