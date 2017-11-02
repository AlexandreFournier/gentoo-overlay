EAPI=5

DESCRIPTION="Osmocom software defined radio TETRA receiver"
HOMEPAGE="http://github.com/sq5bpf/osmo-tetra-sq5bpf"

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/sq5bpf/osmo-tetra-sq5bpf.git"
	EGIT_SOURCEDIR="${WORKDIR}/${PN}"
	KEYWORDS=""
	S="${WORKDIR}/${PN}"
else
	die "This software does not provide source package yet :("
fi

LICENSE="GPL"
SLOT="0"

RDEPEND="
	net-wireless/gnuradio[wxwidgets]
	net-libs/libosmocore
	net-wireless/gr-osmosdr
	!net-wireless/osmo-tetra
"

DEPEND="${RDEPEND}"

SRC="${S}/src"

src_compile() {
	emake -C ${SRC}
}

src_install() {
	exeinto /usr/bin
	doexe ${SRC}/demod/python-3.7/tetra-demod.py || die
	doexe ${SRC}/demod/python-3.7/simdemod2.py || die
	doexe ${SRC}/float_to_bits || die
	doexe ${SRC}/tetra-rx || die
}


