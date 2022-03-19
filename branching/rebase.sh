#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$* Parameter #$count = $param"
for param in "$@"; do
    echo "Next parameter: $param"
    count=$(( $count + 1 ))
done
