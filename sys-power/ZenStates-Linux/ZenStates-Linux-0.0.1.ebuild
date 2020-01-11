# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )

inherit systemd

DESCRIPTION="Dynamically edit AMD Ryzen processor P-States"
HOMEPAGE="https://github.com/r4m0n/ZenStates-Linux https://github.com/jfredrickson/disable-c6"
COMMIT=0bc27f4740e382f2a2896dc1dabfec1d0ac96818
SER_COMMIT=82765d490290a99ba18282e187e9de3d7c11dd49
SRC_URI="
	https://github.com/r4m0n/ZenStates-Linux/archive/${COMMIT}.tar.gz -> ${PN}-${COMMIT}.tar.gz
	https://github.com/jfredrickson/disable-c6/archive/${SER_COMMIT}.tar.gz -> disable-c6-${SER_COMMIT}.tar.gz
	"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dosbin zenstates.py
	sed -i 's/^ExecStart={{PREFIX}}\/bin/ExecStart=\/usr\/sbin/g' "${WORKDIR}/disable-c6-${SER_COMMIT}/disable-c6.service.template"
	mv "${WORKDIR}/disable-c6-${SER_COMMIT}/disable-c6.service.template" "${WORKDIR}/disable-c6-${SER_COMMIT}/disable-c6.service"
	systemd_dounit "${WORKDIR}/disable-c6-${SER_COMMIT}/disable-c6.service"
}
