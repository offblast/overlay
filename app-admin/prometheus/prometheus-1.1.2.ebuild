# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EGO_PN="github.com/prometheus/${PN}"
EGO_BUILD_FLAGS="-tags netgo"
EGIT_COMMIT="v${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

inherit golang-vcs-snapshot
inherit golang-build

DESCRIPTION="The Prometheus monitoring system and time series database"
HOMEPAGE="https://prometheus.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	for prog in prometheus promtool; do
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		go build -v -work -x ${EGO_BUILD_FLAGS} -ldflags \
		"-X /vendor/github.com/prometheus/common/version.Version=${PV}" \
		"${EGO_PN}/cmd/${prog}"
	done
}

src_install() {
	dobin prometheus
	dobin promtool
	dodir "/usr/share/${PN}"
	cp -r "src/${EGO_PN}/consoles" "${D}/usr/share/${PN}"
	cp -r "src/${EGO_PN}/console_libraries" "${D}/usr/share/${PN}"
}

