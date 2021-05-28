#!/usr/bin/env bash

function generr() {
  FILE=${1//patches\//}
  DIFF_TEXT=`cat $1`
  DIFF_TEXT="${DIFF_TEXT//'%'/'%25'}"
  DIFF_TEXT="${DIFF_TEXT//$'\n'/'%0A'}"
  DIFF_TEXT="${DIFF_TEXT//$'\r'/'%0D'}"
  LINE=`cut -sd "@" -f3 $1 | cut -d "," -f2 | cut -f1 -d " "`
  echo "::error file=./$FILE,line=$LINE,col=1::$DIFF_TEXT"
}

export -f generr

find patches -type f -exec bash -c "generr {}" \;
