#!/bin/bash

# hardcode filepath to howto.txt
howtofilepath="$HOME/notes/docs/howto.txt"

# check args
if [[ "$#" -eq 0 ]]; then
    echo "Please enter an argument."
    echo "Usage howto [search, terms]"
    echo "Usage howto -a [where-to-add] [text-to-add]"
    exit 1
fi

if [ "$1" == "-a" ]; then
    if [ "$#" -ne 3 ]; then
        echo "Invalid number of args given for appending."
        echo "Append useage is: ht -a [where-to-add-text] [text-to-add]"
        exit 1
    fi
    heading="$2"
    addition="$3"

    echo "Adding $addition under heading: # $heading"
    sed -i -e "/\#[[:space:]]$heading/a $addition" "$howtofilepath"
else

    search_query="$1"
    reverse_query="$1"

    seperator='.*'

    for arg in "$@"; do
        # if arg is first arg then do nothing
        if [[ "$arg" == "$search_query" ]]; then
            continue
        fi
        # concatenate search query with seperator and new query string
        search_query="$search_query$seperator$arg"
        reverse_query="$arg$seperator$reverse_query"
    done

    search_query="$search_query$seperator"
    reverse_query="$reverse_query$seperator"

    full_search_query="$search_query|$reverse_query"
    # /* after variable as otherwise it treats the /* as a literal path

    # search how to file with color highlighting
    grep --color=auto -E "$full_search_query" "$howtofilepath"
fi
