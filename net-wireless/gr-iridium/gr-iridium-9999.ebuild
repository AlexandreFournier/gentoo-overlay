EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit python-single-r1 cmake-utils git-2

DESCRIPTION="GNURadio Iridium Out Of Tree Module"
HOMEPAGE="https://github.com/muccc/gr-iridium.git"

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/muccc/gr-iridium.git"
	EGIT_SOURCEDIR="${WORKDIR}/${PN}"
	KEYWORDS=""
	S="${WORKDIR}/${PN}"
else
	die "This software does not provide source package yet :("
fi

LICENSE="GPL"
SLOT="0"

DEPEND="
	>=net-wireless/gnuradio-3.7
	${PYTHON_DEPS}
"

RDEPEND="${DEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
