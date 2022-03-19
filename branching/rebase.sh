#!/bin/bash
# display command line options

count=1
<<<<<<< HEAD
for param in "$@"; do
=======
for param in "$*"; do
>>>>>>> git-merge
    echo "\$* Parameter #$count = $param"
    count=$(( $count + 1 ))
done
