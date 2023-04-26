#!/bin/bash

howtofile = '/repos/howto/howto.txt'

for arg in "$@"; do
   grep --color=auto -E $arg howtofile 
done

# search for commands
search_for_commands () {
    grep -E 'command:.*$2' howtofile
}

# grep -E 'expr1.*expr2|expr2.*expr1'

# search for description 
search_for_description () {
    grep -E 'description:.*$2' howtofile
}
