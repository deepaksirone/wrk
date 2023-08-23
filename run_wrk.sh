#! /usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

log_prefix=$1
benchmark_name=$2

set -x

for i in {1..3}; do
	log_name=${log_prefix}_${benchmark_name}.${i}_${i}.log
	./wrk -c$i -t$i -d10 -s test.lua http://spigot.cs.wisc.edu:80/event_notify/ > $log_name
	cat $log_name
done
