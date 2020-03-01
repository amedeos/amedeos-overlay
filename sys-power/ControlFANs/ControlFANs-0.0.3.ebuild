# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit qmake-utils
QTMIN=5.14

DESCRIPTION=" Control FANs data using hwmon interface"
HOMEPAGE="https://github.com/amedeos/ControFANs"
SRC_URI="https://github.com/amedeos/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	eqmake5 ${PN}.pro
}

src_install() {
	dosbin ${PN}
}
