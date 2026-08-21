# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vim-plugin

GIT_COMMITSH="e75f8ea12b4a0bcfe46c564a3a78ff7361b0a1c6"

DESCRIPTION="vim plugin: set of tools for editing Yocto bitbake-based recipes"
HOMEPAGE="https://github.com/kergoth/vim-bitbake"
SRC_URI="https://github.com/kergoth/vim-bitbake/archive/${GIT_COMMITSH}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/vim-bitbake-${GIT_COMMITSH}"

LICENSE="MIT"
KEYWORDS="amd64 x86"

VIM_PLUGIN_HELPTEXT="Vim Syntax highlight for Yocto bitbake-based recipes"
