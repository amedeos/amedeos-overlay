# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="A linter for YAML files."
HOMEPAGE="https://yamllint.readthedocs.io/"
SRC_URI="https://github.com/adrienverge/${PN}/archive/v${PV}.tar.gz -> ${PN}-v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/pyyaml
        >=dev-python/pathspec-0.5.3"
RDEPEND="${DEPEND}"
BDEPEND=""
