# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{9,10} pypy3 )

inherit distutils-r1 systemd

DESCRIPTION="Create virtual BMCs for controlling virtual instances via IPMI"
HOMEPAGE="https://docs.openstack.org/virtualbmc/latest/"
SRC_URI="https://files.pythonhosted.org/packages/41/bc/88ba1975f2791e1b42627a2b3a9daeac699bb6669c4e3837300d425c2566/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND=""
RDEPEND="
	dev-python/pyghmi
	dev-python/cliff
	dev-python/pyzmq
	acct-user/vbmc
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_test() {
	distutils_install_for_testing
	pytest -vv || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	systemd_newunit "${FILESDIR}/virtualbmc.service" virtualbmc.service
}
