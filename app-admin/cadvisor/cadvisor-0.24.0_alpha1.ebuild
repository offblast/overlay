# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PV="${PV/_/-}"

EGO_PN="github.com/google/${PN}"
EGIT_COMMIT="v${MY_PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

inherit golang-vcs-snapshot
inherit golang-build

DESCRIPTION="https://${EGO_PN}"
HOMEPAGE="Container Advisor"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86 ~arm64 ~ppc64"
IUSE=""
DEPEND=""
RDEPEND=""

#RESTRICT="test"

S="${WORKDIR}/${P}"

src_prepare() {
	export GO15VENDOREXPERIMENT==1
	default
}

src_install() {
		dodoc "${S}"/src/${EGO_PN}/{CHANGELOG.md,CONTRIBUTING.md,README.md}
		dobin "${S}/${PN}"
}

