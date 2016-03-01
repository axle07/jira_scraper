#!/bin/bash

# Run this command first to establish correct cookie (named "cooky" here)
#curl --cookie-jar cooky -d 'username=NAME%40DOMAIN.com&password=PASSWORD%21&dest-url=&xsrf=' https://YOURDOMAIN.atlassian.net/login
# Test that it worked
#curl -b cooky -O https://YOURDOMAIN.atlassian.net/secure/attachment/12604/2015-08-20_17-30-19.jpg

COUNTER=0

until [ $COUNTER -gt 2000 ]; do
    let COUNTER=COUNTER+1
    mkdir ./attachments/SF-$COUNTER; cd ./attachments/SF-$COUNTER
    curl -b ../../../cooky https://spyfoo.atlassian.net/browse/SF-$COUNTER | egrep -o 'secure/attachment/[0-9]+/[^\"]+' | perl -ne 'print "https://spyfoo.atlassian.net/$_"' | xargs curl -O -b ../../../cooky 
    cd ../..
done
