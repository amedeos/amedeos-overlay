# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{9,10,11} pypy3 )

inherit distutils-r1 systemd

DESCRIPTION="A set of tools to support the development and test of the Sushy library"
HOMEPAGE="https://docs.openstack.org/sushy/"
SRC_URI="https://files.pythonhosted.org/packages/8d/46/8160b690ed7c515b7a7962e03aca43a1febba5c4ab756aa789c1fdac18fc/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND=""
RDEPEND="
	acct-user/vbmc
	dev-python/flask
	dev-python/pytz
	dev-python/netifaces
	dev-python/netaddr
	dev-python/ifaddr
	dev-python/zipp
	dev-python/wrapt
	dev-python/webob
	dev-python/urllib3
	dev-python/tenacity
	dev-python/rfc3986
	dev-python/pyyaml
	dev-python/pyparsing
	dev-python/pbr
	dev-python/markupsafe
	dev-python/itsdangerous
	dev-python/iso8601
	dev-python/idna
	dev-python/fasteners
	dev-python/click
	dev-python/charset_normalizer
	dev-python/certifi
	dev-python/bcrypt
	dev-python/async-timeout
	dev-python/zeroconf
	dev-python/werkzeug
	dev-python/stevedore
	dev-python/requests
	dev-python/packaging
	dev-python/oslo-utils
	dev-python/oslo-config
	dev-python/oslo-concurrency
	dev-python/oslo-i18n
	dev-python/jinja
	dev-python/importlib-metadata
	dev-python/debtcollector
	dev-python/ironic-lib
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_test() {
	distutils_install_for_testing
	pytest -vv || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	mkdir -p etc/sushy-emulator
	insinto /etc/sushy-emulator
	doins "${FILESDIR}/sushy-emulator.conf"
	systemd_newunit "${FILESDIR}/sushy-emulator.service" sushy-emulator.service
}
