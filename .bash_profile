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

# conscript
export CONSCRIPT_HOME="$HOME/.conscript"
export CONSCRIPT_OPTS="-Dfile.encoding=UTF-8"
export PATH=$CONSCRIPT_HOME/bin:$PATH

# gcloud sdk
export GLOUD_SDK_HOME="$HOME/.google-cloud-sdk"
export CLOUDSDK_PYTHON=/usr/bin/python
export PATH=$GLOUD_SDK_HOME/bin:$PATH

# for macos
if [[ $(uname) =~ "Darwin" ]]; then
        # set java home
	export JAVA_HOME=`/usr/libexec/java_home`
	export GRADLE_HOME=/usr/local/opt/gradle/libexec

	# brew home function
	function brew_home_path {
		echo $(brew info ${1} | grep -E -o  "/usr/local/Cellar/${1}/(\d+\.?)+" | tail -1)
	}

	# set hadoop home
	export HADOOP_HOME=/usr/local/opt/hadoop/libexec
	export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
	export HIVE_HOME=/usr/local/opt/hive/libexec
	export SPARK_HOME=/usr/local/opt/apache-spark/libexec
	export MAHOUT_HOME=/usr/local/opt/mahout/libexec

	# browser for jupyter notebook open
	export BROWSER=open

fi
