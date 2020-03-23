# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )

inherit desktop

DESCRIPTION="A NordVPN GUI client for linux using the native Network Manager"
HOMEPAGE="https://github.com/vfosterm/NordVPN-NetworkManager-Gui"
SRC_URI="https://github.com/vfosterm/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-vpn/openvpn
	net-vpn/networkmanager-openvpn
	dev-python/PyQt5
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	sed -i 's/nordvpnicon\.png/\/usr\/share\/pixmaps\/nordvpnicon\.png/g' nord_nm_gui.py
	dobin nord_nm_gui.py

	DESK_FILE=NordVPN-NetworkManager-GUI.desktop
	cat <<EOF >> $DESK_FILE
[Desktop Entry]
Name=NordVPN-NetworkManager-GUI
Comment=NordVPN NetworkManager GUI
Exec=/usr/bin/python3 /usr/bin/nord_nm_gui.py
Icon=/usr/share/pixmaps/nordvpnicon.png
Type=Application
Terminal=false
Categories=Qt;Network;
EOF

	doicon nordvpnicon.png
	domenu $DESK_FILE
}
