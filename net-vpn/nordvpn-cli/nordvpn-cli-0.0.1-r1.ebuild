# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )

DESCRIPTION="A tool for managing NordVPN profiles for OpenVPN"
HOMEPAGE="https://gitlab.com/mausworks/nordvpn-cli"
COMMIT=9cef556194ad28bd6034b2cf8e222bca3e30d464
SRC_URI="https://gitlab.com/mausworks/nordvpn-cli/repository/archive.tar.gz?ref=9cef556194ad28bd6034b2cf8e222bca3e30d464 -> ${PN}-${COMMIT}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}-${COMMIT}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-vpn/openvpn"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	sed -i 's/^SERVERS=\"\$NODE \$CWD\//SERVERS=\"\$NODE \/usr\/sbin\//g' nordvpn
	dosbin nordvpn
	dosbin nordvpn-servers.js
	dosbin "${FILESDIR}"/update-nordvpn.sh
	mkdir -p /etc/openvpn/client
}
