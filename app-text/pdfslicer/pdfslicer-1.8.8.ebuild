# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 desktop

DESCRIPTION="A simple application to extract, merge, rotate and reorder pages of PDF documents"
HOMEPAGE="https://junrrein.github.io/pdfslicer/"
#SRC_URI="https://github.com/junrrein/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

EGIT_REPO_URI="https://github.com/junrrein/${PN}"
EGIT_COMMIT="v${PV}"
EGIT_SUBMODULES=( '*' )

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-cpp/gtkmm"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/opt/pdfslicer
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	dosym /opt/pdfslicer/share/applications/com.github.junrrein.PDFSlicer.desktop /usr/share/applications/com.github.junrrein.PDFSlicer.desktop
}

pkg_postinst() {
	sed -E -i 's+Icon=com.github.junrrein.PDFSlicer+Icon=/opt/pdfslicer/share/icons/hicolor/scalable/apps/com.github.junrrein.PDFSlicer.svg+g' /opt/pdfslicer/share/applications/com.github.junrrein.PDFSlicer.desktop
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
