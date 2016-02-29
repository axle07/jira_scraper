#!/bin/bash

COUNTER=0

until [ $COUNTER -gt 2000 ]; do
    #echo The counter is $COUNTER
    let COUNTER=COUNTER+1

    curl -b ../cooky https://spyfoo.atlassian.net/browse/SF-$COUNTER | egrep -o 'secure/attachment/[0-9]+/[^\"]+' | perl -ne 'print "https://spyfoo.atlassian.net/$_"' > ./output/SF-$COUNTER
done

