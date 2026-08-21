# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	autocfg@1.5.1
	byteorder@1.5.0
	crossbeam-deque@0.8.7
	crossbeam-epoch@0.9.20
	crossbeam-utils@0.8.22
	either@1.18.0
	heck@0.5.0
	laz@0.12.2
	libc@0.2.189
	num-traits@0.2.19
	once_cell@1.21.4
	portable-atomic@1.15.0
	proc-macro2@1.0.107
	pyo3-build-config@0.29.2
	pyo3-ffi@0.29.2
	pyo3-macros-backend@0.29.2
	pyo3-macros@0.29.2
	pyo3@0.29.2
	quote@1.0.47
	rayon-core@1.13.0
	rayon@1.12.0
	syn@2.0.119
	target-lexicon@0.13.5
	unicode-ident@1.0.24
"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..15} )

inherit cargo distutils-r1

MY_PN="laz-rs-python"
DESCRIPTION="Python bindings for the laz-rs crate"
HOMEPAGE="https://pypi.org/project/lazrs/ https://github.com/laz-rs/laz-rs-python"
SRC_URI="
	https://github.com/laz-rs/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions Unicode-3.0
	|| ( MIT Unlicense )
"
SLOT="0"
KEYWORDS="amd64 arm arm64 hppa ~ia64 ~mips x86"

RESTRICT="mirror"
