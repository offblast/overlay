# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit user systemd

KEYWORDS="~amd64"
DESCRIPTION="A highly-available key value store for shared configuration and service discovery"
HOMEPAGE="https://github.com/coreos/etcd/"
SRC_URI="https://github.com/coreos/etcd/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="doc"
DEPEND=">=dev-lang/go-1.6:="
RDEPEND="!dev-db/etcdctl"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/${PN} ${PN}
}

src_prepare() {
	sed -e 's|GIT_SHA=.*|GIT_SHA=v${PV}|'\
		-e 's|-ldflags "-s.*"|-v -x|' \
		-e 's|-ldflags "-s|-v -x "|' \
		-i build || die
	sed -e 's|go test|\0 -v|'\
		-i test || die
}

src_compile() {
	./build || die
}

src_install() {
	dobin bin/*
	dodoc README.md
	use doc && dodoc -r Documentation
	dodir /var/lib/${PN}
	fowners ${PN}:${PN} /var/lib/${PN}
	fperms 755 /var/lib/${PN}
}

src_test() {
	./test || die
}
