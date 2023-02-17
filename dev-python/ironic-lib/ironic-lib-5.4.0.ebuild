# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{9,10,11} pypy3 )

inherit distutils-r1 systemd

DESCRIPTION="Ironic common library"
HOMEPAGE="https://docs.openstack.org/ironic-lib/"
SRC_URI="https://files.pythonhosted.org/packages/de/80/7cd67824e5549772467915d185e5dbdebbd5395d0e3fb9edcfedc2967e56/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND=""
RDEPEND="
	acct-user/vbmc
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_test() {
	distutils_install_for_testing
	pytest -vv || die "Tests fail with ${EPYTHON}"
}

