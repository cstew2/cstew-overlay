#!/bin/bash

_print_help() {
	cat <<- EOF
	Usage:
		$(basename $0) [options]

		-s | --supported   Returns by current CUDA supported gcc versions
		-c | --clang       Returns by current CUDA supported clang versions
		-h | --help        Shows this help
	EOF
}

_get_gcc_versions() {
	GCC_MAX_VER=$(grep -oP "#if __GNUC__ > \K[0-9]*" ${CUDA_PATH}/targets/x86_64-linux/include/crt/host_config.h)

	local cuda_supported_gcc=( 8.5 9.5 )
	for ((ver=10; ver<=GCC_MAX_VER; ver++)); do
		cuda_supported_gcc+=( "${ver}" )
	done

	echo "${cuda_supported_gcc[*]}"
}

_get_clang_versions() {
	CLANG_MAX_VER=$(grep -oP "#if \(__clang_major__ >= \K[0-9]*" ${CUDA_PATH}/targets/x86_64-linux/include/crt/host_config.h | awk 'NR == 2')

	local cuda_supported_clang=()
	for ((ver=7; ver<CLANG_MAX_VER; ver++)); do
		cuda_supported_clang+=( "${ver}" )
	done

	echo "${cuda_supported_clang[*]}"
}

case ${1} in
	-s|--supported)
	    _get_gcc_versions
		exit 0
		;;
	-c|--clang)
		_get_clang_versions
		exit 0
		;;
	-h|--help)
		_print_help
		exit 255
		;;
	*)
		_print_help
		exit 1
		;;
esac
