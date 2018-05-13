#!/bin/bash
# fw=grape_webrick; endpoint=random; port=9292; ab -n 1000 -c 6 "http://localhost:${port}/${endpoint}"; ab -n 1000 -c 6 "http://localhost:${port}/${endpoint}" > ${fw}_ab_n1kc6_${endpoint}.log

# ab params
n=1000  # number of requests
c=6     # concurrency

if [ 2 -ne 0$# ]; then
  echo "USE: $0 <port> <test_description>" >&2
  exit 1
fi

port=${1}
fw=${2}

for endpoint in random static; do
  url="http://localhost:${port}/${endpoint}"
  echo "benchmarking ${url}"
  # pre-heat
  ab -n ${n} -c ${c} "${url}"
  # measure
  ab -n ${n} -c ${c} "${url}" > ${fw}_ab_n$((n/1000))kc${c}_${endpoint}.log
done
