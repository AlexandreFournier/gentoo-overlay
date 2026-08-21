# Copyright 2019-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Diagram as Code"
HOMEPAGE="https://diagrams.mingrammer.com/ https://github.com/mingrammer/diagrams"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND="
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
"
