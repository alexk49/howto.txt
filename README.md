# howto.txt

The howto.txt is for people who like doing things but can't remember how.

It is heavily inspired by the [todo.txt](https://github.com/todotxt). Because of this some plugins that have be written for the todo.txt can be useful.

It is particularly useful for the sort of terminal/vim commands you use just often enough to need regularly but not quite often enough to remember. 

Simply, follow the format of:

actual-instruction/command      description of tasks +tags +relevant +to +tasks @topic @tags

The howto.sh is a simple script that provides a quick command line search of the howto.txt file.

The provided howto.txt file is served as an example and the expected use case is that you would build one from scratch gradually. 

## What is this madness?

Nothing on the example howto.txt file is meant as a definitive reference. And, it has been built up over time. Whilst the information you might put in the howto.txt file can always be found via the internet, help and manual pages, sometimes the act of searching takes time. By adding commands and their use case, in your own words, you can create a useful resource that you can quickly access.

## Tags

These are directly taken from [todo.txt](https://github.com/todotxt) format and are just a way of organising information you add that can be useful for more specific searches.

You can use @ as a context tag, which is where you might need a particular entry. For example, @vim, @python or @linux. And, then add topic tags with the + sign. For example, a line about changing permissions for a file on a linux system might read:

```
chmod 700 file         change file permissions so that only the owner can execute it @linux +execute +permissions
```

## Tips and tricks

Add an alias to your .bashrc:

```
alias ht='path/to/your/howto.sh'
```

This then allows searching the file with commands like:

```
ht virtual environment python
```

which depending on your howto file would return all matches for the words virtual environment python in any order. For example, entries might look like:

```
conda activate virtual-env-name         activate a jupyter virtual environment @python +jupyter
python -m venv /path/to/new/virtual/environment         create virtual environment, if running in current dir then you can run python -m venv .venv (with .venv being the name of your virtual environment @python +virtual +environment
```

## Usage 

Search file:
```
ht search terms
```

Add to a file:

```
ht -a "new entry to add to howto.txt file"
```

Quickly edit howto file in text editor:

```
ht -e
```

If using vim, the [todo.txt plugin](https://github.com/freitass/todo.txt-vim) can make the file more user friendly in the editor.
