# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

EGO_PN="github.com/google/${PN}"
EGIT_COMMIT="v${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
https://github.com/badgerodon/peg/archive/9e5f7f4d07ca576562618c23e8abadda278b684f.tar.gz -> peg-9e5f7f4d07ca576562618c23e8abadda278b684f.tar.gz
https://github.com/barakmich/glog/archive/fafcb6128a8a2e6360ff034091434d547397d54a.tar.gz -> glog-fafcb6128a8a2e6360ff034091434d547397d54a.tar.gz
https://github.com/boltdb/bolt/archive/04a3e85793043e76d41164037d0d7f9d53eecae3.tar.gz -> bolt-04a3e85793043e76d41164037d0d7f9d53eecae3.tar.gz
https://github.com/cznic/mathutil/archive/f9551431b78e71ee24939a1e9d8f49f43898b5cd.tar.gz -> mathutil-f9551431b78e71ee24939a1e9d8f49f43898b5cd.tar.gz
https://github.com/gogo/protobuf/archive/58bbd41c1a2d1b7154f5d99a8d0d839b3093301a.tar.gz -> protobuf-58bbd41c1a2d1b7154f5d99a8d0d839b3093301a.tar.gz
https://github.com/julienschmidt/httprouter/archive/b59a38004596b696aca7aa2adccfa68760864d86.tar.gz -> httprouter-b59a38004596b696aca7aa2adccfa68760864d86.tar.gz
https://github.com/lib/pq/archive/0dad96c0b94f8dee039aa40467f767467392a0af.tar.gz -> pq-0dad96c0b94f8dee039aa40467f767467392a0af.tar.gz
https://github.com/pborman/uuid/archive/ca53cad383cad2479bbba7f7a1a05797ec1386e4.tar.gz -> uuid-ca53cad383cad2479bbba7f7a1a05797ec1386e4.tar.gz
https://github.com/peterh/liner/archive/1bb0d1c1a25ed393d8feb09bab039b2b1b1fbced.tar.gz -> liner-1bb0d1c1a25ed393d8feb09bab039b2b1b1fbced.tar.gz
https://github.com/robertkrimen/otto/archive/d1b4d8ef0e0e4b088c8328c95ca63ab9ebd8fc9d.tar.gz -> otto-d1b4d8ef0e0e4b088c8328c95ca63ab9ebd8fc9d.tar.gz
https://github.com/russross/blackfriday/archive/17bb7999de6cfb791d4f8986cc00b3309b370cdb.tar.gz -> blackfriday-17bb7999de6cfb791d4f8986cc00b3309b370cdb.tar.gz
https://github.com/shurcooL/sanitized_anchor_name/archive/8e87604bec3c645a4eeaee97dfec9f25811ff20d.tar.gz -> sanitized_anchor_name-8e87604bec3c645a4eeaee97dfec9f25811ff20d.tar.gz
https://github.com/syndtr/goleveldb/archive/4875955338b0a434238a31165cb87255ab6e9e4a.tar.gz -> goleveldb-4875955338b0a434238a31165cb87255ab6e9e4a.tar.gz
https://github.com/syndtr/gosnappy/archive/156a073208e131d7d2e212cb749feae7c339e846.tar.gz -> gosnappy-156a073208e131d7d2e212cb749feae7c339e846.tar.gz
https://github.com/go-mgo/mgo/archive/c6a7dce14133ccac2dcac3793f1d6e2ef048503a.tar.gz -> mgo-c6a7dce14133ccac2dcac3793f1d6e2ef048503a.tar.gz
"

DESCRIPTION="An open-source graph database"
HOMEPAGE="https://cayley.io/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

get_archive_go_package() {
	local archive=${1} uri x
	case ${archive} in
		mgo-*) echo "mgo-* gopkg.in/mgo.v2"; return;;
	esac
	for x in ${SRC_URI}; do
		if [[ ${x} == https* ]]; then
			uri=${x}
		elif [[ ${x} == ${archive} ]]; then
			break
		fi
	done
	uri=${uri#https://}
	uri=${uri%/archive/*}
	echo "${uri##*/}-* ${uri}"
}

unpack_go_packages() {
	local go_package pattern x
	# Unpack packages to appropriate locations for GOPATH
	for x in ${A}; do
		unpack ${x}
		if [[ ${x} == *.tar.gz ]]; then
			go_package=$(get_archive_go_package ${x})
			pattern=${go_package%% *}
			go_package=${go_package##* }
			if [[ ${x%.tar.gz} -ef ${S} ]]; then
				mv "${S}"{,_} || die
				mkdir -p "${S}/src/${go_package%/*}" || die
				mv "${S}"_ "${S}/src/${go_package}" || die || die
			else
				mkdir -p "${S}/src/${go_package%/*}" || die
				for x in ${pattern}; do
					if [[ ! ${x} -ef ${S} ]]; then
						mv "${x}" "${S}/src/${go_package}" || die
					fi
				done
			fi
		fi
	done
}

src_unpack() {
	unpack_go_packages
}

src_compile() {
	GOPATH="${WORKDIR}/${P}" \
		go install -v -work -x ${EGO_BUILD_FLAGS} \
		-ldflags="-X main.Version=v${PV}" \
		"${EGO_PN}/cmd/${PN}" || die

	GOPATH="${WORKDIR}/${P}" \
		go install -v -work -x ${EGO_BUILD_FLAGS} \
		"${EGO_PN}/cmd/${PN}upgrade" || die
}

src_install() {
	dobin "${S}/bin/${PN}"
	dobin "${S}/bin/${PN}upgrade"
	dodoc "${S}/src/${EGO_PN}/README.md"
}

