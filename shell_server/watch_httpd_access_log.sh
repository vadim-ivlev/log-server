#!/bin/bash

# TEST AND MONITOR APACHE LOG (IVLEV)

# Put 200k  tail of the access_log 
# in /var/www/html/tails/ directory 
# every 5 seconds






#while true; do sleep 1; tail -c 5k /var/log/httpd/access_log > tail5k.log; done &

while true
do 
    tail -c 200k /var/log/httpd/access_log > /var/www/html/tails/tail200k.txt;
    sleep 5 
done

