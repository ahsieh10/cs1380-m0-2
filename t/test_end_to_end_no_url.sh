#!/bin/bash

#This ends up hanging, so not used in test-all

T_FOLDER=${T_FOLDER:-t}
R_FOLDER=${R_FOLDER:-}

cd "$(dirname "$0")/..$R_FOLDER" || exit 1

DIFF=${DIFF:-diff}
DIFF_PERCENT=${DIFF_PERCENT:-0}

cat /dev/null > d/visited.txt
cat /dev/null > d/global-index.txt

cat "$T_FOLDER"/d/u2.txt > d/urls.txt

./engine.sh

if $DIFF <(sort d/visited.txt) <(sort "$T_FOLDER"/d/v2.txt) > /dev/null;
then
    echo "$0 success: visited urls are identical"
else
    echo "$0 failure: visited urls are not identical"
fi

if DIFF_PERCENT=$DIFF_PERCENT t/gi-diff.js <(sort d/global-index.txt) <(sort "$T_FOLDER"/d/i2.txt) > /dev/null;
then
    echo "$0 success: global-index is identical"
else
    echo "$0 failure: global-index is not identical"
fi
