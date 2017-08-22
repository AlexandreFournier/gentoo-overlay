EAPI=5

inherit cmake-utils

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

RDEPEND="
	>=net-wireless/gnuradio-3.7
"

DEPEND="${RDEPEND}"

