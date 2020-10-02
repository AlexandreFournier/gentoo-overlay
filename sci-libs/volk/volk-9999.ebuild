# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

#https://github.com/gnuradio/volk/issues/383
CMAKE_BUILD_TYPE="None"
inherit cmake-utils python-single-r1

DESCRIPTION="vector optimized library of kernels"
HOMEPAGE="http://libvolk.org"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gnuradio/volk.git"
	EGIT_CLONE_TYPE="shallow"
	KEYWORDS=""
else
	SRC_URI="https://github.com/gnuradio/volk/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="orc test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}
	!<net-wireless/gnuradio-3.8
	dev-libs/boost:=
	orc? ( dev-lang/orc )"
DEPEND="${RDEPEND}
	$(python_gen_cond_dep 'dev-python/mako[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]')"

src_configure() {
	local mycmakeargs=(
		-DENABLE_ORC=$(usex orc)
		-DPYTHON_EXECUTABLE="${PYTHON}"
		-DENABLE_TESTING="$(usex test)"
		-DENABLE_PROFILING=OFF
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	python_optimize
}

