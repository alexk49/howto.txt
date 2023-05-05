#!/bin/bash

# hardcode filepath to howto.txt
howtofilepath=$HOME'/repos/howto/howto.txt'

search_query=$1

seperator='.*'

# loop through passed on arguments
for arg in "$@"; do
    # if arg is first arg then do nothing
    if [[ $arg == $search_query ]]; then
        continue
    fi
    # concatenate search query with seperator and new query string
    search_query=$search_query$seperator$arg
done

# search how to file with color highlighting
grep --color=auto -e $search_query $howtofilepath
