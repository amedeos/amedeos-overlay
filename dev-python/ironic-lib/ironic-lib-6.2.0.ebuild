# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{10,11,12} pypy3 )

inherit distutils-r1 systemd

DESCRIPTION="Ironic common library"
HOMEPAGE="https://docs.openstack.org/ironic-lib/"
SRC_URI="https://files.pythonhosted.org/packages/d6/af/f405b3d9a9df03351537c1823ff72e6ab0b384c538c2f7c8b817c40a01dd/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

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

