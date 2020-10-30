# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6,7,8} pypy3 )

inherit distutils-r1 systemd

DESCRIPTION="pyVmomi is the Python SDK for the VMware vSphere API that allows you to manage ESX, ESXi, and vCenter"
HOMEPAGE="https://github.com/vmware/pyvmomi"
SRC_URI="https://files.pythonhosted.org/packages/eb/87/ebf153a3aafdac7c54c5578b6240d7930a8c0a1a21bdd98d271fd131673c/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND=""
RDEPEND="
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_test() {
	distutils_install_for_testing
	pytest -vv || die "Tests fail with ${EPYTHON}"
}

