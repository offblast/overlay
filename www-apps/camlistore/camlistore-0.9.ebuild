# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

EGO_PN="github.com/camlistore/${PN}"
EGIT_COMMIT="${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Camlistore is your personal storage system for life"
HOMEPAGE="https://camlistore.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	pushd "${WORKDIR}/${P}/src/${EGO_PN}" >/dev/null
	# XXX: work around missing VERSION file in 0.9.
	echo "${PV}" > "${WORKDIR}/${P}/src/${EGO_PN}/VERSION"
	env GOPATH="${WORKDIR}/${P}" \
		go run "${WORKDIR}/${P}/src/${EGO_PN}/make.go" || die
	popd
}

src_install() {
	for prog in camget camput camtool camlistored; do
		dobin "${WORKDIR}/${P}/src/${EGO_PN}/bin/${prog}"
	done

	dodoc "${WORKDIR}/${P}/src/${EGO_PN}/README"
}

