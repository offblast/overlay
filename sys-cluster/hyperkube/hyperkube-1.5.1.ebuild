# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

MY_PV="${PV/_/-}"
MY_PV="${MY_PV/_rc/.}"

EGO_PN="k8s.io/kubernetes"
EGIT_COMMIT="v${MY_PV}"
SRC_URI="https://github.com/kubernetes/kubernetes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Production-Grade Container Orchestration"
HOMEPAGE="https://k8s.io"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		go build -o "${WORKDIR}/${P}/bin/${PN}" -v -work -x ${EGO_BUILD_FLAGS} ${EGO_PN}/cmd/${PN}
}

src_install() {
	dobin "${WORKDIR}/${P}/bin/${PN}"
	# no proxy for now, conflicts with net-libs/libproxy
	for prog in apiserver controller-manager federation-apiserver federation-controller-manager kubectl kubelet scheduler; do
		dosym ${PN} /usr/bin/${prog}
	done
}

