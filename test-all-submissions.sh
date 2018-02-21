#!/bin/sh
MAGENTA="\033[0;35m"
RED="\033[0;31m"
GREEN="\033[0;32m"
CLEAR="\033[0m"

echo "$MAGENTA""== testing all submissions. ==""$CLEAR"

# test all user provided solutions, for actual pull requests
set -e
for WEEK in $(ls challenges | sort -V); do
    echo "$MAGENTA""testing week: $WEEK""$CLEAR"
    cd challenges/$WEEK
    for LANGUAGE in $(ls -t); do
        echo "$MAGENTA""testing language: $LANGUAGE""$CLEAR"
        cd $LANGUAGE
        make
        cd ..
    done
    cd ../..
done

echo "$MAGENTA""== complete (wow!). ==""$CLEAR"
