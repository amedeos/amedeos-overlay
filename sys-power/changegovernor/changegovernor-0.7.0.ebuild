# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7,8} )

inherit systemd

DESCRIPTION="Change CPU governor based on processes running"
HOMEPAGE="https://github.com/amedeos/changegovernor"
SRC_URI="https://github.com/amedeos/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/psutil
	sys-apps/lm-sensors
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dosbin changegovernor.py
	insinto /etc
	doins changegovernor.json
	systemd_dounit "${PN}.service"
}
