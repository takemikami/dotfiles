# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Get the aliases and functions
if [ -f ~/.bash_profile_local ]; then
	. ~/.bash_profile_local
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# anyenv
export PATH
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# node modules bin
export PATH=$PATH:./node_modules/.bin

# for macos
if [[ $(uname) =~ "Darwin" ]]; then
	# brew home function
	function brew_home_path {
		echo $(brew info ${1} | grep -E -o  "/usr/local/Cellar/${1}/(\d+\.?)+" | tail -1)
	}

	# set hadoop home
	export HADOOP_HOME=$(brew_home_path hadoop)/libexec
	export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
	export HIVE_HOME=$(brew_home_path hive)/libexec
	export SPARK_HOME=$(brew_home_path apache-spark)/libexec
	export MAHOUT_HOME=$(brew_home_path mahout)/libexec

	# browser for jupyter notebook open
	export BROWSER=open

fi
