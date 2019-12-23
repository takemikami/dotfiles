# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

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

# embulk
export PATH=$HOME/.embulk/bin:$PATH

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

# activate venv
if [ -f venv/bin/activate ]; then
  . venv/bin/activate
fi

