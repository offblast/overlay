# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-vcs-snapshot
inherit golang-build

EGO_PN="github.com/xyproto/${PN}"
EGIT_COMMIT="${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
https://github.com/bobappleyard/readline/archive/7e300e02d38ee8b418c0b4841877f1845d392328.tar.gz -> readline-7e300e02d38ee8b418c0b4841877f1845d392328.tar.gz
https://github.com/boltdb/bolt/archive/dfb21201d9270c1082d5fb0f07f500311ff72f18.tar.gz -> bolt-dfb21201d9270c1082d5fb0f07f500311ff72f18.tar.gz
https://github.com/bradfitz/http2/archive/aa7658c0e9902e929a9ed0996ef949e59fc0f3ab.tar.gz -> http2-aa7658c0e9902e929a9ed0996ef949e59fc0f3ab.tar.gz
https://github.com/didip/tollbooth/archive/9adc32f5171e833befc340a64b63602529fc0373.tar.gz -> tollbooth-9adc32f5171e833befc340a64b63602529fc0373.tar.gz
https://github.com/eknkc/amber/archive/91774f050c1453128146169b626489e60108ec03.tar.gz -> amber-91774f050c1453128146169b626489e60108ec03.tar.gz
https://github.com/fatih/color/archive/533cd7fd8a85905f67a1753afb4deddc85ea174f.tar.gz -> color-533cd7fd8a85905f67a1753afb4deddc85ea174f.tar.gz
https://github.com/fsnotify/fsnotify/archive/30411dbcefb7a1da7e84f75530ad3abe4011b4f8.tar.gz -> fsnotify-30411dbcefb7a1da7e84f75530ad3abe4011b4f8.tar.gz
https://github.com/garyburd/redigo/archive/b8dc90050f24c1a73a52f107f3f575be67b21b7c.tar.gz -> redigo-b8dc90050f24c1a73a52f107f3f575be67b21b7c.tar.gz
https://github.com/getwe/figlet4go/archive/accc26b01fe9ddb12c1b2ce19c2212551d70af87.tar.gz -> figlet4go-accc26b01fe9ddb12c1b2ce19c2212551d70af87.tar.gz
https://github.com/golang/crypto/archive/5bcd134fee4dd1475da17714aac19c0aa0142e2f.tar.gz -> crypto-5bcd134fee4dd1475da17714aac19c0aa0142e2f.tar.gz
https://github.com/golang/net/archive/c4c3ea71919de159c9e246d7be66deb7f0a39a58.tar.gz -> net-c4c3ea71919de159c9e246d7be66deb7f0a39a58.tar.gz
https://github.com/golang/sys/archive/076b546753157f758b316e59bcb51e6807c04057.tar.gz -> sys-076b546753157f758b316e59bcb51e6807c04057.tar.gz
https://github.com/go-sql-driver/mysql/archive/3654d25ec346ee8ce71a68431025458d52a38ac0.tar.gz -> mysql-3654d25ec346ee8ce71a68431025458d52a38ac0.tar.gz
https://github.com/juju/ratelimit/archive/77ed1c8a01217656d2080ad51981f6e99adaa177.tar.gz -> ratelimit-77ed1c8a01217656d2080ad51981f6e99adaa177.tar.gz
https://github.com/klauspost/compress/archive/14eb9c4951195779ecfbec34431a976de7335b0a.tar.gz -> compress-14eb9c4951195779ecfbec34431a976de7335b0a.tar.gz
https://github.com/klauspost/cpuid/archive/09cded8978dc9e80714c4d85b0322337b0a1e5e0.tar.gz -> cpuid-09cded8978dc9e80714c4d85b0322337b0a1e5e0.tar.gz
https://github.com/klauspost/crc32/archive/19b0b332c9e4516a6370a0456e6182c3b5036720.tar.gz -> crc32-19b0b332c9e4516a6370a0456e6182c3b5036720.tar.gz
https://github.com/klauspost/pgzip/archive/95e8170c5d4da28db9c64dfc9ec3138ea4466fd4.tar.gz -> pgzip-95e8170c5d4da28db9c64dfc9ec3138ea4466fd4.tar.gz
https://github.com/mamaar/risotto/archive/c3b4f4dbac6541f11ed5bc1b97d00ef06bbe34c0.tar.gz -> risotto-c3b4f4dbac6541f11ed5bc1b97d00ef06bbe34c0.tar.gz
https://github.com/mattn/go-runewidth/archive/d6bea18f789704b5f83375793155289da36a3c7f.tar.gz -> go-runewidth-d6bea18f789704b5f83375793155289da36a3c7f.tar.gz
https://github.com/mitchellh/go-homedir/archive/981ab348d865cf048eb7d17e78ac7192632d8415.tar.gz -> go-homedir-981ab348d865cf048eb7d17e78ac7192632d8415.tar.gz
https://github.com/mitchellh/mapstructure/archive/d2dd0262208475919e1a362f675cfc0e7c10e905.tar.gz -> mapstructure-d2dd0262208475919e1a362f675cfc0e7c10e905.tar.gz
https://github.com/natefinch/pie/archive/13d3874dc4836d5db81d3a950aa5436b1eb23372.tar.gz -> pie-13d3874dc4836d5db81d3a950aa5436b1eb23372.tar.gz
https://github.com/nsf/termbox-go/archive/8930de04764634cd4ac7b3bd33480681b194fe0c.tar.gz -> termbox-go-8930de04764634cd4ac7b3bd33480681b194fe0c.tar.gz
https://github.com/russross/blackfriday/archive/1d6b8e9301e720b08a8938b8c25c018285885438.tar.gz -> blackfriday-1d6b8e9301e720b08a8938b8c25c018285885438.tar.gz
https://github.com/shurcooL/sanitized_anchor_name/archive/10ef21a441db47d8b13ebcc5fd2310f636973c77.tar.gz -> sanitized_anchor_name-10ef21a441db47d8b13ebcc5fd2310f636973c77.tar.gz
https://github.com/sirupsen/logrus/archive/f3cfb454f4c209e6668c95216c4744b8fddb2356.tar.gz -> logrus-f3cfb454f4c209e6668c95216c4744b8fddb2356.tar.gz
https://github.com/tylerb/graceful/archive/cc92da329b6bafe9c05e73728fb377eea184e761.tar.gz -> graceful-cc92da329b6bafe9c05e73728fb377eea184e761.tar.gz
https://github.com/xyproto/cookie/archive/b84c85ae2aa3e21b2c7fc8c37d5a3081c0c9c83b.tar.gz -> cookie-b84c85ae2aa3e21b2c7fc8c37d5a3081c0c9c83b.tar.gz
https://github.com/xyproto/jpath/archive/19557bd0413e39439388198e12bf6be16583b785.tar.gz -> jpath-19557bd0413e39439388198e12bf6be16583b785.tar.gz
https://github.com/xyproto/mime/archive/58d5c367ee5b5e10f4662848579b8ccd759b280e.tar.gz -> mime-58d5c367ee5b5e10f4662848579b8ccd759b280e.tar.gz
https://github.com/xyproto/permissionbolt/archive/65ca75f842f2bdfd5f57c6e99fbd1b31bf5e5d21.tar.gz -> permissionbolt-65ca75f842f2bdfd5f57c6e99fbd1b31bf5e5d21.tar.gz
https://github.com/xyproto/permissions2/archive/6a884b2c2914bfbc42c391ae5dd683a6331ef358.tar.gz -> permissions2-6a884b2c2914bfbc42c391ae5dd683a6331ef358.tar.gz
https://github.com/xyproto/permissionsql/archive/d517b172d4846d40dce3870244009df6326c6bcb.tar.gz -> permissionsql-d517b172d4846d40dce3870244009df6326c6bcb.tar.gz
https://github.com/xyproto/pinterface/archive/21f55042b599a5de383bcd9e9c839e920d33eeb6.tar.gz -> pinterface-21f55042b599a5de383bcd9e9c839e920d33eeb6.tar.gz
https://github.com/xyproto/pongo2/archive/3789aabbe5087474a02f4879c0b0045fd5d90d96.tar.gz -> pongo2-3789aabbe5087474a02f4879c0b0045fd5d90d96.tar.gz
https://github.com/xyproto/recwatch/archive/eec3775073f11929973b0d06507a682f8061babb.tar.gz -> recwatch-eec3775073f11929973b0d06507a682f8061babb.tar.gz
https://github.com/xyproto/simplebolt/archive/349c7ad35b3b6e29a47f39ee122281911a067ff7.tar.gz -> simplebolt-349c7ad35b3b6e29a47f39ee122281911a067ff7.tar.gz
https://github.com/xyproto/simplemaria/archive/80759a73a6b576479bbf2baf955f7a46e04cb5b5.tar.gz -> simplemaria-80759a73a6b576479bbf2baf955f7a46e04cb5b5.tar.gz
https://github.com/xyproto/simpleredis/archive/de7b4cb9d1be983af7e9924394a27b67927e4918.tar.gz -> simpleredis-de7b4cb9d1be983af7e9924394a27b67927e4918.tar.gz
https://github.com/xyproto/term/archive/9e12074e834ac795cf9e5d8ac4f3149babb59576.tar.gz -> term-9e12074e834ac795cf9e5d8ac4f3149babb59576.tar.gz
https://github.com/xyproto/unzip/archive/823950573952ff86553b26381fe7472549873cb4.tar.gz -> unzip-823950573952ff86553b26381fe7472549873cb4.tar.gz
https://github.com/yosssi/gcss/archive/39677598ea4f3ec1da5568173b4d43611f307edb.tar.gz -> gcss-39677598ea4f3ec1da5568173b4d43611f307edb.tar.gz
https://github.com/yuin/gluamapper/archive/d836955830e75240d46ce9f0e6d148d94f2e1d3a.tar.gz -> gluamapper-d836955830e75240d46ce9f0e6d148d94f2e1d3a.tar.gz
https://github.com/yuin/gopher-lua/archive/47f0f792b296190027f38d577f0860e2dad7a777.tar.gz -> gopher-lua-47f0f792b296190027f38d577f0860e2dad7a777.tar.gz
"

DESCRIPTION="HTTP/2 web/application server with built-in support for Lua, Markdown, Sass and Pongo2"
HOMEPAGE="http://algernon.roboticoverlords.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sys-libs/readline"
RDEPEND="${DEPEND}"

get_archive_go_package() {
	local archive=${1} uri x
	case ${archive} in
		crypto-*) echo "crypto-* golang.org/x/crypto"; return;;
		net-*) echo "net-* golang.org/x/net"; return;;
		sys-*) echo "sys-* golang.org/x/sys"; return;;
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
		go install -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}" || die
}

src_install() {
	dobin "${S}/bin/algernon"
	dobin "${S}/src/${EGO_PN}/desktop/mdview"
	dodoc "${S}/src/${EGO_PN}/README.md"
}

