# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{6,7,8} pypy3 )

inherit distutils-r1

DESCRIPTION="Python SDK for version 4 of the oVirt Engine API"
HOMEPAGE="https://www.ovirt.org/"
SRC_URI="https://files.pythonhosted.org/packages/6e/6d/b99529783c47d8308017e76e812c317b5735a1868ab4d6589d3f71178219/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ASL 2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND=""
RDEPEND="
	dev-libs/libxml2
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_test() {
	distutils_install_for_testing
	pytest -vv || die "Tests fail with ${EPYTHON}"
}
