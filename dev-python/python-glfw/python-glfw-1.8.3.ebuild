# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=(python2_7 python3_6)
inherit distutils-r1

DESCRIPTION="Python bindings for the GLFW library"
HOMEPAGE="https://github.com/FlorianRhiem/pyGLFW
	https://pypi.org/project/glfw/"
SRC_URI="https://github.com/FlorianRhiem/pyGLFW/releases/download/v${PV}/glfw-${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/glfw-${PV}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=(README.rst)

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	distutils-r1_python_compile
}

python_test() {
	"${PYTHON}" -m unittest discover -v || die "Tests fail with ${EPYTHON}"
}
