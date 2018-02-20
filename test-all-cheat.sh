#!/bin/sh
# test pre-provided solutions, for actual pull requests
set -e
for WEEK in $(ls challenges | sort -V); do
    echo "Testing week: $WEEK"
    cd challenges/$WEEK
    for LANGUAGE in $(ls -t); do
        echo "Testing language $LANGUAGE"
        cd $LANGUAGE
        make cheat
        cd ..
    done
    cd ../..
done
exit 1
