#!/bin/sh

cd $(dirname $0)

for f in `find home`; do
  tgt=${f:5}
  if [ ${#tgt} -gt 0 ]; then
    if [ ! -f ~/${tgt} ]; then
      # new file
      cp home/${tgt} ~/${tgt}
      echo "home/${tgt} -> ~/${tgt} (new file)"
    else
      # check difference
      linecnt=$(diff home/${tgt} ~/${tgt} | wc -l)
      if [ $linecnt -ne 0 ]; then
        diff home/${tgt} ~/${tgt}
        echo "update ~/${tgt}, ok(y/N)?"
        read INPUT
        if [ "$INPUT" = "y" ]; then
          cp ~/${tgt} ~/${tgt}.bak
          cp home/${tgt} ~/${tgt}
          echo "home/${tgt} -> ~/${tgt} (update)"
        fi
      fi
    fi
  fi
done
