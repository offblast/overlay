# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

EGO_PN="github.com/prometheus/${PN}"
EGIT_COMMIT="${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Prometheus exporter for machine metrics"
HOMEPAGE="https://prometheus.io/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
    env GOPATH="${WORKDIR}/${P}" \
        go build -v -work -x ${EGO_BUILD_FLAGS} -tags "netgo static_build" \
		-ldflags "-X github.com/prometheus/node_exporter/vendor/github.com/prometheus/common/version.Version=${PV}" \
		"${EGO_PN}" || die
}

src_install() {
	dobin node_exporter
}

