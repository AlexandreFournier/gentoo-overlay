EAPI=5

DESCRIPTION="Tetra live monitor"
HOMEPAGE="https://github.com/sq5bpf/telive"

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/sq5bpf/telive.git"
	EGIT_SOURCEDIR="${WORKDIR}/${PN}"
	KEYWORDS=""
	S="${WORKDIR}/${PN}"
else
	die "This software does not provide source package yet :("
fi

LICENSE="GPL"
SLOT="0"

RDEPEND="media-libs/etsi-amr"
DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	exeinto /usr/bin
	doexe telive || die
	doexe rxx || die
	doexe rxx2 || die

	mkdir -p ${D}/tetra/{bin,in,log,out,tmp}
	chmod 777 ${D}/tetra/{in,log,out,tmp}

	exeinto /tetra/bin
	doexe bin/tetrad || die
	doexe bin/tplay || die
	dosym /usr/bin/cdecoder /tetra/bin/cdecoder || die
	dosym /usr/bin/sdecoder /tetra/bin/sdecoder || die
}

