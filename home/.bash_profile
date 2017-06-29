# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

# anyenv
export PATH
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# node modules bin
export PATH=$PATH:./node_modules/.bin

# mac browser for jupyter notebook open
export BROWSER=open

