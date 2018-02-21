#!/bin/sh
MAGENTA="\033[0;35m"
RED="\033[0;31m"
GREEN="\033[0;32m"
CLEAR="\033[0m"

# test any language for latest week, for submission pull requests
WEEK=$(ls challenges | sort -V | tail -n 1)
echo "$MAGENTA""testing most recent week: $WEEK""$CLEAR"
cd challenges/$WEEK
for LANGUAGE in $(ls -t); do
    echo "$MAGENTA""trying language: $LANGUAGE""$CLEAR"
    cd $LANGUAGE
    make
    if [ $? -eq 0 ]; then
        echo "$GREEN""language $LANGUAGE succeeded!""$CLEAR"
        exit 0
    fi
    cd ..
done
echo "$RED""no language succeeded.""$CLEAR"
exit 1
