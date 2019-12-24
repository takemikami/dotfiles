# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# enable bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# node modules bin
export PATH=$PATH:./node_modules/.bin

# perl modules path
export PERL5LIB=$HOME/perl5/lib/perl5/

# conscript
export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-Dfile.encoding=UTF-8"
export PATH=$CONSCRIPT_HOME/bin:$PATH

# calibre
export PATH=$PATH:/Applications/calibre.app/Contents/MacOS/

# for macos
if [[ $(uname) =~ "Darwin" ]]; then
  # set java home
	export JAVA_HOME=`/usr/libexec/java_home`
	export GRADLE_HOME=/usr/local/opt/gradle/libexec

	# browser for jupyter notebook open
	export BROWSER=open
fi

# load local settings
for f in `find ~/.bash_profile.d/*`; do . $f ; done

