# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

EGO_PN="github.com/coreos/${PN}"
EGIT_COMMIT="v${PV}"
SRC_URI="https://${EGO_PN}/releases/download/${EGIT_COMMIT}/${PN}_${EGIT_COMMIT}_src.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Torus is an open source project for distributed storage coordinated through etcd"
HOMEPAGE="https://${EGO_PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	pushd "${WORKDIR}/${P}/src/${EGO_PN}" >/dev/null || die
	for prog in ${PN}d ${PN}ctl ${PN}blk; do
		GOPATH="${WORKDIR}/${P}" go build -v -work -x \
			-ldflags "-X ${EGO_PN}.Version=v${PV}" \
			-o "bin/${prog}" "./cmd/${prog}" || die
	done
	popd
}

src_install() {
	pushd "${WORKDIR}/${P}/src/${EGO_PN}" >/dev/null || die
	for prog in ${PN}d ${PN}ctl ${PN}blk; do
		dobin "bin/${prog}"
	done
	popd
}

