# howto.txt

The howto.txt is for people who like doing things but can't remember how. 

It is heavily inspired by the [todo.txt](https://github.com/todotxt). 

It is particularly useful for the sort of terminal/vim commands you use just often enough to need regularly but not quite often enough to remember. 

Simply, follow the format of:

description of task: actual-instruction +tags +relevant +to +tasks

For example, you might need a reminder for some variation of the ls linux command. Then you would write: 

list all files including hidden files / list hidden files: ls -al +list +hidden +linux +terminal 

The description is deliberately overly verbose and includes different variations of searches. 

This means the above could be easily accessed via: 

grep "list" howto.txt

or:

grep "hidden" howto.txt 

And be included in numerous more searches with ease. 
