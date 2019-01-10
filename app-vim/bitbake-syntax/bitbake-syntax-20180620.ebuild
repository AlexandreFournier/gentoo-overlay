# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vim-plugin

DESCRIPTION="vim plugin: set of tools for editing Yocto bitbake-based recipes"
HOMEPAGE="https://github.com/kergoth/vim-bitbake"
LICENSE="MIT"
KEYWORDS="amd64 x86"

GIT_COMMITSH="4532d107bb14ab86f235ad534dd2bd2d4806d1b1"
SRC_URI="https://github.com/kergoth/vim-bitbake/archive/${GIT_COMMITSH}.tar.gz -> ${P}.tar.gz"
VIM_PLUGIN_HELPTEXT="Vim Syntax highlight for Yocto bitbake-based recipes"

S="${WORKDIR}/vim-bitbake-${GIT_COMMITSH}"

src_prepare() {
	default
}
