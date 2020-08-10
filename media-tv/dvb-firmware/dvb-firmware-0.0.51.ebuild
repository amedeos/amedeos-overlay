# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="dvb-demod-* firmware from the OpenELEC project"
HOMEPAGE="https://github.com/OpenELEC/dvb-firmware"
#SRC_URI="https://github.com/OpenELEC/${PN}/archive/${PV}.tar.gz"
snapshot_commit="3fef04a4a4bfeba88ae3b20aff9d3a1fabf1c159"
SRC_URI="https://github.com/OpenELEC/dvb-firmware/archive/${snapshot_commit}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-${snapshot_commit}"


LICENSE="all-rights-reserved freedist ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /lib/firmware
	doins -r firmware/dvb-demod-*
}
