# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_BUILD_FLAGS="-ldflags"

DESCRIPTION="Name resolution for containers"
HOMEPAGE="https://github.com/containers/dnsname"
SRC_URI="https://github.com/containers/dnsname/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

LDFLAGS="" # flag provided but not defined: -Wl,-O1
