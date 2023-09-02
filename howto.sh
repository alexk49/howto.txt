#!/bin/bash

# hardcode filepath to howto.txt
howtofilepath="$HOME/notes/docs/howto.txt"

EDITOR=vim; export EDITOR

add_to_file () {
    echo "adding $addition to $howtofilepath"
    echo "$addition" >> "$howtofilepath"
    return

}

edit_file () {
    "$EDITOR" "$howtofilepath"
    return 0
}

usage () {
    echo "Usage howto [search, terms]"
    echo "Add to file: howto -a [text-to-add]"
    echo "Edit file: howto -e" 
    exit 1
}

# check args
if [[ "$#" -eq 0 ]]; then
    echo "Please enter an argument."
    usage
fi

if [[ "$1" == "-a" ]]; then
    addition="$2"
    add_to_file
elif [[ "$1" == "-e" ]]; then
    edit_file
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
