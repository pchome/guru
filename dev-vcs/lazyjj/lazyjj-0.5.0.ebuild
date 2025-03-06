# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.5

EAPI=8

CRATES="
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.95
	autocfg@1.4.0
	bitflags@2.8.0
	bumpalo@3.17.0
	byteorder@1.5.0
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.2.14
	cfg-if@1.0.0
	chrono@0.4.39
	clap@4.5.29
	clap_builder@4.5.29
	clap_derive@4.5.28
	clap_lex@0.7.4
	colorchoice@1.0.3
	compact_str@0.8.1
	console@0.15.10
	core-foundation-sys@0.8.7
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	deranged@0.3.11
	either@1.13.0
	encode_unicode@1.0.0
	equivalent@1.0.2
	errno@0.3.10
	fnv@1.0.7
	foldhash@0.1.4
	fuchsia-cprng@0.1.1
	getrandom@0.3.1
	hashbrown@0.15.2
	heck@0.5.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	ident_case@1.0.1
	indexmap@2.7.1
	indoc@2.0.5
	insta@1.42.1
	instability@0.3.7
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.14
	js-sys@0.3.77
	lazy_static@1.5.0
	libc@0.2.169
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.15
	lock_api@0.4.12
	log@0.4.25
	lru@0.12.5
	memchr@2.7.4
	minimal-lexical@0.2.1
	mio@1.0.3
	nom@7.1.3
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.19
	num_threads@0.1.7
	once_cell@1.20.3
	overload@0.1.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pin-project-internal@1.1.9
	pin-project-lite@0.2.16
	pin-project@1.1.9
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	proc-macro2@1.0.93
	quote@1.0.38
	rand@0.4.6
	rand@0.9.0
	rand_chacha@0.9.0
	rand_core@0.3.1
	rand_core@0.4.2
	rand_core@0.9.0
	ratatui@0.29.0
	rdrand@0.4.0
	redox_syscall@0.5.8
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	remove_dir_all@0.5.3
	rustix@0.38.44
	rustversion@1.0.19
	ryu@1.0.19
	scopeguard@1.2.0
	serde@1.0.217
	serde_derive@1.0.217
	serde_json@1.0.138
	serde_spanned@0.6.8
	sharded-slab@0.1.7
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simdutf8@0.1.5
	similar@2.7.0
	smallvec@1.14.0
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	syn@2.0.98
	tempdir@0.3.7
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	thread_local@1.1.8
	time-core@0.1.2
	time@0.3.37
	toml@0.8.20
	toml_datetime@0.6.8
	toml_edit@0.22.24
	tracing-attributes@0.1.28
	tracing-chrome@0.7.2
	tracing-core@0.1.33
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	tui-textarea@0.7.0
	tui_confirm_dialog@0.2.5
	unicode-ident@1.0.16
	unicode-segmentation@1.12.0
	unicode-truncate@1.1.0
	unicode-width@0.1.14
	unicode-width@0.2.0
	utf8parse@0.2.2
	valuable@0.1.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.7.2
	wit-bindgen-rt@0.33.0
	zerocopy-derive@0.7.35
	zerocopy-derive@0.8.18
	zerocopy@0.7.35
	zerocopy@0.8.18
"

declare -A GIT_CRATES=(
	[ansi-to-tui]='https://github.com/Cretezy/ansi-to-tui;74bd97e76066186cace33ea04cf497055db67e62;ansi-to-tui-%commit%'
)

inherit cargo

DESCRIPTION="TUI for Jujutsu/jj"
HOMEPAGE="https://github.com/Cretezy/lazyjj"
SRC_URI="
	${CARGO_CRATE_URIS}
	"https://github.com/Cretezy/${PN}/archive/refs/tags/v${PV}.tar.gz" -> ${P}.tar.gz
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+=" Apache-2.0 ISC MIT Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND+="dev-vcs/jj"

QA_FLAGS_IGNORED="usr/bin/lazyjj"
