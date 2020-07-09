# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
#PYTHON_COMPAT=( python3_{6,7,8} )
inherit bash-completion-r1

DESCRIPTION="Basic bash completion for Ansible"
HOMEPAGE="https://github.com/dysosmus/ansible-completion"
COMMIT=ad00a6d7850a50420b3febc6a4cc387184a1a5cc
SRC_URI="https://github.com/dysosmus/ansible-completion/archive/ad00a6d7850a50420b3febc6a4cc387184a1a5cc.tar.gz -> ${PN}-${COMMIT}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/bash-completion"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	newbashcomp ansible-completion.bash ansible
	newbashcomp ansible-doc-completion.bash ansible-doc
	newbashcomp ansible-galaxy-completion.bash ansible-galaxy
	newbashcomp ansible-playbook-completion.bash ansible-playbook
	newbashcomp ansible-pull-completion.bash ansible-pull
	newbashcomp ansible-vault-completion.bash ansible-vault
}
