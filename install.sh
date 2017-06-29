#!/bin/sh

cd $(dirname $0)

for f in `find home`; do
  tgt=${f:5}
  if [ ${#tgt} -gt 0 ]; then
    echo "cp home/${tgt} ~/${tgt}"
  fi
done
