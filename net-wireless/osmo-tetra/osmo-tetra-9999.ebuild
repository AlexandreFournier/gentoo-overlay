EAPI=5

DESCRIPTION="Osmocom software defined radio TETRA receiver"
HOMEPAGE="http://tetra.osmocom.org/"

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://git.osmocom.org/osmo-tetra.git"
	EGIT_SOURCEDIR="${WORKDIR}/${PN}"
	EGIT_MASTER="gr3.7"
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
	!net-wireless/osmo-tetra-sq5bpf
"

DEPEND="${RDEPEND}"

SRC="${S}/src"

src_prepare() {
	sed -i 's/set_gain_mode(0)/set_gain_mode(False)/' ${SRC}/demod/osmosdr-tetra_demod_fft.py || die
	sed -i 's/set_gain_mode(1)/set_gain_mode(True)/' ${SRC}/demod/osmosdr-tetra_demod_fft.py || die
	sed -i 's/src.set_gain_mode(self.iagc/src.set_gain_mode(bool(self.iagc)/' ${SRC}/demod/osmosdr-tetra_demod_fft.py || die
}

src_compile() {
	emake -C ${SRC}
}

src_install() {
	exeinto /usr/bin
	doexe ${SRC}/demod/cqpsk.py || die
	doexe ${SRC}/demod/osmosdr-tetra_demod_fft.py || die
	doexe ${SRC}/float_to_bits || die
	doexe ${SRC}/tetra-rx || die
}


