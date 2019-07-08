#!/bin/bash

pushd make_check_initializer
./init.sh
result="$?"
popd

if [[ "$result" -eq 0 ]]; then
  sed -i 's/REGRESS =.*/REGRESS = griddb_fdw griddb_fdw_data_type float4 float8 int4 int8 numeric join limit aggregates prepare select_having select insert update griddb_fdw_post/' Makefile
  make clean && make && make check
fi
