#!/usr/bin/env bash

. "${BASH_SOURCE%/*}/common-build-env.sh"

activate_virtualenv
set_pythonpath

#  usage:
#    for release build : ./tserver_lto.sh
#    for prof_gen build : ./tserver_lto.sh prof_gen
#    for prof_use build : ./tserver_lto.sh prof_use path/to/pgo/data

if [[ $# -gt 0 ]]; then
  build_type=$1
  validate_build_type "$build_type"
  shift
  if [[ $build_type == "prof_use" ]]; then
    expect_num_args 1 "$@"
    pgo_data_path="$1"
    shift
  fi
else
  build_type="release"
fi

if [[ $( uname -m ) == "x86_64" ]]; then
  build_root_basename="$build_type-clang14-full-lto-ninja"
else
  build_root_basename="$build_type-clang12-full-lto-ninja"
fi

dep_graph_cmd=(
  "${YB_SRC_ROOT}/python/yb/dependency_graph.py"
  "--build-root=${YB_SRC_ROOT}/build/${build_root_basename}"
  "--file-regex=^.*/yb-tserver$"
  )
if [[ $build_type == "prof_use" ]]; then
  dep_graph_cmd+=( "--build-args=--pgo-data-path ${pgo_data_path}" )
fi
dep_graph_cmd+=( link-whole-program "$@" )

set -x
"${dep_graph_cmd[@]}"
