# howto.txt

The howto.txt is for people who like doing things but can't remember how. 

It is heavily inspired by the [todo.txt](https://github.com/todotxt). 

It is particularly useful for the sort of terminal/vim commands you use just often enough to need regularly but not quite often enough to remember. 

Simply, follow the format of:

actual-instruction/command      description of tasks +tags +relevant +to +tasks @topic @tags

## What is this madness?

This is not a definitive reference for anything and has been built up over time. I know the information can be found through the help and manual pages etc. but I've found this serves as a quick reference for something I have already looked up and found useful but not yet memorised. 

To be honest, one of the main motivators for making this is simply that I find the act of writing/typing something to be the best way for me to take the information in.

## Basic search

For example, you might need a reminder for some variation of the ls linux command. Then you would write: 

list all files including hidden files / list hidden files: ls -al +list +hidden @linux @terminal 

The description is deliberately overly verbose and includes different variations of searches. 

This means the above could be easily accessed via: 

grep "list" howto.txt

or:

grep "hidden" howto.txt 

For a better search see the [howto-cli](https://github.com/alexk49/howto-cli)

## Topic tag

The topic tag should be used for the overarching subject. This should be something you anticipate having a lot of different commands/reminders for. For example, I use @vim and @linux as main topic tags.

I found it useful for adding headers for the topics just to split the actual file up when adding to it.

And be included in numerous more searches with ease. 

## Howto-cli

For an easy search wrapper the [howto-cli](https://github.com/alexk49/howto-cli) can be used.
