#!/bin/bash

T_FOLDER=${T_FOLDER:-t}
R_FOLDER=${R_FOLDER:-}

cd "$(dirname "$0")/..$R_FOLDER" || exit 1

DIFF=${DIFF:-diff}
DIFF_PERCENT=${DIFF_PERCENT:-0}

cat /dev/null > "$T_FOLDER"/d/output.txt

cat "$T_FOLDER"/d/m1.txt | c/merge.js "$T_FOLDER"/d/dblank.txt > d/temp-global-index.txt
mv d/temp-global-index.txt "$T_FOLDER"/d/output.txt

if DIFF_PERCENT=$DIFF_PERCENT t/gi-diff.js <(sort "$T_FOLDER"/d/output.txt) <(sort "$T_FOLDER"/d/m5.txt) > /dev/null;
then
    echo "$0 success: global indexes are identical"
else
    echo "$0 failure: global indexes are not identical"
fi
