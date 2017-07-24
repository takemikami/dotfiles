# ~/.bash_profile: executed by bash(1) for login shells.

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

ATOM_HOME=/c/Users/takes/AppData/Local/atom/
ANACONDA_HOME=/c/Users/takes/Anaconda3

export PATH=$PATH:$ATOM_HOME:$ANACONDA_HOME/Scripts:$ANACONDA_HOME

alias python="winpty python"
alias ipython="winpty ipython"
alias jupyter="winpty jupyter"

if [ -z "$TMUX" ]; then
  tmux
fi
