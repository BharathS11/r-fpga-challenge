#!/bin/sh
# test any language for latest week, for submission pull requests
WEEK=$(ls challenges | sort -V | tail -n 1)
echo "Testing most recent week: $WEEK"
cd challenges/$WEEK
for LANGUAGE in $(ls -t); do
    echo "Trying language $LANGUAGE"
    cd $LANGUAGE
    make
    if [ $? -eq 0 ]; then
        echo "Language $LANGUAGE succeeded!"
        exit 0
    fi
    cd ..
done
echo "No language succeeded."
exit 1
