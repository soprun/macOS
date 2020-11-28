#!/bin/bash

# see: https://blog.patshead.com/2012/11/a-couple-of-useful-snippets-from-my-shell-config.html

tail() {
  local thbin="/usr/bin/tail"
  local fc lpf thbin

  if [ "${1:0:1}" != "-" ]; then
    fc=$(($#==0?1:$#))
    lpf="$((($LINES - 3 - 2 * $fc) / $fc))"
    lpf="$(($lpf<1?2:$lpf))"

    [ $fc -eq 1 ] && $thbin -n $lpf "$@" | /usr/bin/fold -w $COLUMNS | $thbin -n
  else
    $thbin "$@"
  fi
}
