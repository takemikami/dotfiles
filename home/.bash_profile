# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH=$PATH:./node_modules/.bin
eval "$(anyenv init -)"
