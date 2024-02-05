#!/bin/bash
T_FOLDER=${T_FOLDER:-t}
R_FOLDER=${R_FOLDER:-}

cd "$(dirname "$0")/..$R_FOLDER" || exit 1

DIFF=${DIFF:-diff}


url="hiiiii"

if $DIFF <(cat "$T_FOLDER"/d/dblank.txt | c/invert.sh $url | sed 's/[[:space:]]//g') <(cat "$T_FOLDER"/d/dblank.txt | sed 's/[[:space:]]//g') > /dev/null;
then
    echo "$0 success: inverted indices are identical"
else
    echo "$0 failure: inverted indices are not identical"
fi
