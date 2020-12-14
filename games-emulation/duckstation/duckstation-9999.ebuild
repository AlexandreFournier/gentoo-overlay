# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

# usefull for src/scmversion/gen_scmversion.sh
CMAKE_IN_SOURCE_BUILD=1

DESCRIPTION="PlayStation 1, aka. PSX Emulator"
HOMEPAGE="https://github.com/stenzek/duckstation"

if [[ ${PV} == 9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/stenzek/duckstation.git"
    EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
	EGIT_SUBMODULES=()
    S="${WORKDIR}/${PN}"
    KEYWORDS="amd64"
else
	SRC_URI="https://github.com/stenzek/duckstation/archive/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="sdl qt5 egl -wayland"

REQUIRED_USE="
	wayland? ( egl )
"

BDEPEND="
	dev-util/ninja
	dev-util/patchelf
"
DEPEND="
	sdl? ( media-libs/libsdl2 )
	x11-libs/gtk+
	qt5? (
		dev-qt/qtcore
		dev-qt/qtgui
		dev-qt/qtnetwork
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SDL_FRONTEND="$(usex sdl ON OFF)"
		-DBUILD_QT_FRONTEND="$(usex qt5 ON OFF)"
		-DUSE_SDL2="$(usex sdl ON OFF)"
		-DUSE_WAYLAND="$(usex wayland ON OFF)"
		-DUSE_EGL="$(usex egl ON OFF)"
		-DBUILD_LIBRETRO_CORE=OFF
		-DENABLE_DISCORD_PRESENCE=OFF
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake-utils_src_configure
}

src_install() {
	use sdl && dobin "${BUILD_DIR}"/bin/duckstation-sdl
	use qt5 && dobin "${BUILD_DIR}"/bin/duckstation-qt
}
