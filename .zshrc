# c
export CPATH=`xcrun --show-sdk-path`/usr/include

# java
export JAVA_HOME=`/usr/libexec/java_home -v 15`
export GRADLE_HOME=/usr/local/opt/gradle/libexec

# go bin
export PATH=$PATH:~/go/bin

# load local settings
for f in `find ~/.zshrc.d/*`; do . $f ; done
