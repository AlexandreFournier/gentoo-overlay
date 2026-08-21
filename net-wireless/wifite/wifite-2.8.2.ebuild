# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="An automated wireless attack tool"
HOMEPAGE="https://github.com/kimocoder/wifite2"

MY_P="${PN}2-${PV}"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/kimocoder/wifite2.git"
else
	SRC_URI="https://github.com/kimocoder/${PN}2/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-2"
SLOT="2"
IUSE="dict opencl extra"

RDEPEND="
	dev-python/chardet[${PYTHON_USEDEP}]
	net-analyzer/scapy[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
PDEPEND="
	net-wireless/aircrack-ng
	net-wireless/hcxdumptool
	net-wireless/hcxtools
	amd64? ( opencl? ( app-crypt/hashcat ) )
	dict? ( sys-apps/cracklib-words )
	extra? (
		net-analyzer/wireshark
		net-wireless/reaver-wps-fork-t6x
		!net-wireless/reaver
		net-wireless/bully
		net-wireless/cowpatty
		net-analyzer/macchanger
	)
"

RESTRICT="test"

python_prepare_all() {
	# a leftover poetry stub declaring name=wifite2 version=0.1.0; the real
	# packaging lives in setup.py, which is used once this is out of the way
	rm pyproject.toml || die

	distutils-r1_python_prepare_all
}
