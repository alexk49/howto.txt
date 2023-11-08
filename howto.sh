#!/bin/bash

example_config () {
cat << _EOF_

Example ht.cfg file
~~~~~~~~~~~~~~~~~~~
# set filepath to howto.txt
howtofilepath="path-to-howto.txt"
# set editor variable
EDITOR=vim; export EDITOR

_EOF_
}

add_to_file () {
    # add a new line to the howtofile
    echo "adding $addition to $howtofilepath"
    echo "$addition" >> "$howtofilepath"
    return

}

edit_file () {
    # open file in editor of choice
    "$EDITOR" "$howtofilepath"
    return 0
}

usage () {
cat << _EOF_
Usage howto [search, terms]

Add to file: howto -a [text-to-add]
Edit file: howto -e

howto.sh is set to work with a howto.txt file

This file should consist of one line helpers.
The convention for these should follow:

actual-instruction/command      description of tasks +tags +relevant +to +tasks @topic @tags
_EOF_
exit 1
}

create_search_query () {
    # build search query used on howto.txt
    # query is built so words can be in any order on file
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
}

source_config () {
    # source config file if it exists
    # else exit script
    if [[ -f "$ht_config" ]]; then
        # shellcheck source=./ht.cfg
        source "$ht_config"
    else
        echo "No config file found. Please create config file named ht.cfg"
        echo "This file should be placed in the same directory as howto.sh"
        echo "And, it should set the filepath to your howto.txt and the EDITOR variable for your choice of editor."
        example_config
        exit
    fi
}


ht_dir="$(dirname "$0")"
ht_config="$ht_dir/ht.cfg"

source_config

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
elif [[ "$1" == "-h" || "$1" == "-help" ]]; then
    usage
else
    create_search_query "$@"

    # search how to file with color highlighting
    grep --color=auto -E "$full_search_query" "$howtofilepath"
fi
