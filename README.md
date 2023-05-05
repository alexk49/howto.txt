# howto.txt

The howto.txt is for people who like doing things but can't remember how. 

It is heavily inspired by the [todo.txt](https://github.com/todotxt). 

It is particularly useful for the sort of terminal/vim commands you use just often enough to need regularly but not quite often enough to remember. 

Simply, follow the format of:

actual-instruction      description of tasks +tags +relevant +to +tasks

For example, you might need a reminder for some variation of the ls linux command. Then you would write: 

list all files including hidden files / list hidden files: ls -al +list +hidden +linux +terminal 

The description is deliberately overly verbose and includes different variations of searches. 

This means the above could be easily accessed via: 

grep "list" howto.txt

or:

grep "hidden" howto.txt 

And be included in numerous more searches with ease. 

## Tips and tricks

For ease of create a shell script called howto.sh: 

```bash
#!/bin/bash

for arg in "$@"; do
   grep "$arg" 'path/to/your/howto.txt'
done
```

And, add an alias to your .bashrc:
```
alias ht='path/to/your/howto.sh'
```

I use ht as in "howto" but you can obviously use whatever you woud like. 

This then allows searching the file with:

ht "list hidden"
