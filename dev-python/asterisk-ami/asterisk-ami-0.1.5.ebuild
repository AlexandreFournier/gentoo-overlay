# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="A simple Python AMI client"
HOMEPAGE="https://github.com/ettoreleandrotognoli/python-ami/"
SRC_URI="https://github.com/ettoreleandrotognoli/python-ami/archive/0.1.5.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/python-ami-${PV}"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="examples test"

DEPEND="${RDEPEND}"

python_prepare_all() {
    sed -e "s/'tests'/'tests*'/" -i setup.py || die

    distutils-r1_python_prepare_all
}

python_test() {
    esetup.py test
}

python_install_all() {
    if use examples; then
        dodoc -r examples
        docompress -x /usr/share/doc/${PF}/examples
    fi
    distutils-r1_python_install_all
}
