# howto-cli

This is a simple script to allow better searching of the [howto.txt](https://github.com/alexk49/howto.txt) format.

## Tips and tricks

Add an alias to your .bashrc:

```
alias ht='path/to/your/howto.sh'
```

I use ht as in "howto" but you can obviously use whatever you woud like. 

This then allows searching the file with commands like:

```
ht virtual environment python
```

which depending on your howto file would return all matches for the words virtual environment python in any order. For example, entries might look like:

```
conda activate virtual-env-name         activate a jupyter virtual environment @python +jupyter
python -m venv /path/to/new/virtual/environment         create virtual environment, if running in current dir then you can run python -m venv .venv (with .venv being the name of your virtual environment @python +virtual +environment
```
