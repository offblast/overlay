# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

EGO_PN="github.com/cloudflare/${PN}"
EGO_BUILD_FLAGS="-tags release"
EGIT_COMMIT="${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="CloudFlare's PKI and TLS toolkit "
HOMEPAGE="https://cfssl.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

BINS="${PN}-bundle ${PN}-certinfo ${PN}-newkey ${PN}-scan ${PN} ${PN}json mkbundle multirootca"

src_compile() {
	for prog in ${BINS}; do
		GOPATH="${WORKDIR}/${P}" \
			go build -v -work -x ${EGO_BUILD_FLAGS} \
			"${EGO_PN}/cmd/${prog}"
	done
}

src_install() {
	for prog in ${BINS}; do
		dobin ${prog}
	done
}

