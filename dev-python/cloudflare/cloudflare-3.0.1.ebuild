# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )
DISTUTILS_USE_PEP517="hatchling"
inherit distutils-r1
DESCRIPTION="Python wrapper for the Cloudflare v4 API"
HOMEPAGE="https://pypi.org/project/cloudflare/"
if [ "${PV}" == 9999 ]; then
	EGIT_REPO_URI="https://github.com/cloudflare/cloudflare-python"
	inherit git-r3
else
	MYPV=$(ver_rs 3 -)
	MYPV=${MYPV/beta/beta.}
	MYPN="cloudflare-python"
	SRC_URI="https://github.com/cloudflare/cloudflare-python/archive/refs/tags/v${MYPV}.tar.gz -> ${P}.gh.tar.gz
		test? ( https://github.com/Phoenix591/${MYPN}/releases/download/${PV}/${MYPN}-${PV}-prism.tar.gz )"
	#Prism archive generated by workflow
	# https://github.com/Phoenix591/cloudflare-python/blob/v3.0.0_beta10/.github/workflows/test-tar.yml
	S="${WORKDIR}/${MYPN}-${MYPV}"
	KEYWORDS="~amd64 ~arm64"
fi
LICENSE="MIT test? ( ISC Apache-2.0 MIT BSD CC0-1.0 0BSD )"
# nodejs module and deps used to test
SLOT="3"
RDEPEND=" ${DEPEND}
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.3.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
	 "

BDEPEND="test? (
	>=net-libs/nodejs-18.20.1
	 dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	 dev-python/time-machine[${PYTHON_USEDEP}]
	 dev-python/dirty-equals[${PYTHON_USEDEP}]
	 dev-python/respx[${PYTHON_USEDEP}]
	${RDEPEND}
)"

distutils_enable_tests pytest
RESTRICT+=" !test? ( test )"

src_unpack() {
	unpack "${P}.gh.tar.gz"
	use test && cd "${S}" && unpack "cloudflare-python-${PV}-prism.tar.gz"
}

#python_prepare_all() {
#	# don't install tests or examples
#	sed -i -e "s/'cli4', 'examples'/'cli4'/" \
#		-e "s#'CloudFlare/tests',##" \
#		 setup.py || die
#	sed -i -e "/def test_ips7_should_fail():/i@pytest.mark.xfail(reason='Now fails upstream')" \
#		-e "2s/^/import pytest/" \
#		CloudFlare/tests/test_cloudflare_calls.py || die
#	distutils-r1_python_prepare_all
#}

python_test() {
	# these 2 tests fail in an ebuild environment for some reason
	# help appreciated
	local EPYTEST_DESELECT=(
	tests/test_client.py::TestCloudflare::test_validate_headers
	tests/test_client.py::TestAsyncCloudflare::test_validate_headers )
	if [ "${EPYTHON}" == "python3.11" ]; then
		#fails due to slight memory leak
		EPYTEST_DESELECT+=(
		tests/test_client.py::TestCloudflare::test_copy_build_request )
	fi
	epytest
}

src_test() {
	start_mock
	distutils-r1_src_test
	stop_mock
}
start_mock() {
# Run prism mock api server, this is what needs nodejs
	node --no-warnings node_modules/@stoplight/prism-cli/dist/index.js mock \
		"cloudflare-spec.yml" >prism.log || die "Failed starting prism" &
	echo $! >"${T}/mock.pid" || die
	# Wait for server to come online
	echo -n "Waiting for mockserver"
	while ! grep -q "✖  fatal\|Prism is listening" "prism.log" ; do
	    echo -n "." || die
	    sleep 0.5
	done
	if grep -q "✖  fatal" prism.log; then
		die "Prism mock server failed"
	fi
}
stop_mock() {
	kill $(cat "${T}/mock.pid") || die
}
