# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Baresip is a portable and modular SIP User-Agent with audio and video support."
HOMEPAGE="http://creytiv.com/baresip.html"

LICENSE="BSD"
SLOT="0"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alfredh/baresip.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/alfredh/${PN}/releases/download/v${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

IUSE="alsa amr avahi cairo codec2 +cons evdev ffmpeg +g711 g722 g7221 g726 gsm gstaudio gstvideo gtk h265 ilbc isac jack +l16 libnotify mpa mpg123 mqtt opus opus-ms oss plc portaudio pulseaudio rtcp-summary sdl2 sndfile speex srtp +stdio syslog v4l2 x11 vpx"

REQUIRED_USE="
	libnotify? ( gtk )
	"

DEPEND="
	net-voip/re
	>=media-libs/rem-0.4.7
	alsa? ( media-libs/alsa-lib )
	amr? ( media-libs/opencore-amr )
	avahi? ( net-dns/avahi )
	ffmpeg? ( media-video/ffmpeg )
	cairo? ( x11-libs/cairo )
	codec2? ( media-libs/codec2 )
	evdev? ( dev-libs/libevdev )
	g722? ( media-libs/spandsp )
	g7221? ( media-libs/libg7221 )
	gsm? ( media-sound/gsm )
	gstaudio? (
		media-libs/gstreamer:1.0
		media-libs/gst-plugins-base:1.0
		media-libs/gst-plugins-good:1.0
	)
	gstvideo? (
		media-libs/gstreamer:1.0
		media-libs/gst-plugins-base:1.0
		media-libs/gst-plugins-good:1.0
	)
	gtk? ( x11-libs/gtk+:2 )
	h265? ( media-video/ffmpeg )
	ilbc? ( media-libs/libilbc )
	jack? ( virtual/jack )
	libnotify? ( x11-libs/libnotify )
	mpa? (
		media-sound/twolame
		media-sound/mpg123
		media-libs/speexdsp
	)
	mpg123? ( media-sound/mpg123 )
	mqtt? ( app-misc/mosquitto )
	opus? ( media-libs/opus )
	opus-ms? ( media-libs/opus )
	oss? ( media-libs/alsa-oss )
	plc? ( media-libs/spandsp )
	portaudio? ( media-libs/portaudio )
	pulseaudio? ( media-sound/pulseaudio )
	sdl2? ( media-libs/libsdl2 )
	sndfile? ( media-libs/libsndfile )
	speex? ( media-libs/speex )
	x11? ( x11-libs/libX11 )
	vpx? ( media-libs/libvpx )
	"

RDEPEND="${DEPEND}"

usetf() {
	usex "$1" "yes"
}

src_prepare() {
	sed -i -e 's#/usr/local#/usr#g' Makefile
	sed -i -e 's#$(MOD_AUTODETECT)##' mk/modules.mk
}

src_configure() {
	#export USE_ECHO=
	#export USE_OMX_RPI=
	#export USE_OMX_BELLAGIO=

	export EXTRA_MODULES=dtmfio

	use alsa         && export USE_ALSA=yes
	use amr          && export USE_AMR=yes
	use avahi        && export USE_AVAHI=yes
	use ffmpeg       && export USE_AVCODEC=yes
	use ffmpeg       && export USE_AVFORMAT=yes
	use cairo        && export USE_CAIRO=yes
	use codec2       && export USE_CODEC2=yes
	use cons         && export USE_CONS=yes
	use evdev        && export USE_EVDEV=yes
	use g711         && export USE_G711=yes
	use g722         && export USE_G722=yes
	use g7221        && export USE_G722_1=yes
	use g726         && export USE_G726=yes
	use gsm          && export USE_GSM=yes
	use gstaudio     && export USE_GST=yes
	use gstvideo     && export USE_GST_VIDEO=yes
	use gtk          && export USE_GTK=yes
	use h265         && export USE_H265=yes
	use ilbc         && export USE_ILBC=yes
	use isac         && export USE_ISAC=yes
	use jack         && export USE_JACK=yes
	use l16          && export USE_L16=yes
	use mpa          && export USE_MPA=yes
	use mpg123       && export USE_MPG123=yes
	use mqtt         && export USE_MQTT=yes
	use opus         && export USE_OPUS=yes
	use opus-ms      && export USE_OPUS_MS=yes
	use oss          && export USE_OSS=yes
	use plc          && export USE_PLC=yes
	use portaudio    && export USE_PORTAUDIO=yes
	use pulseaudio   && export USE_PULSE=yes
	use rtcp-summary && export USE_RTCPSUMMARY=yes
	use sdl2         && export USE_SDL2=yes
	use sndfile      && export USE_SNDFILE=yes
	use speex        && export USE_SPEEX_PP=yes
	use srtp         && export USE_SRTP=yes
	use stdio        && export USE_STDIO=yes
	use syslog       && export USE_SYSLOG=yes
	use v4l2         && export USE_V4L2=yes
	use vpx          && export USE_VPX=yes
	use x11          && export USE_X11=yes
}

