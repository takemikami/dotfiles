# java
export JAVA_HOME=`/usr/libexec/java_home`
export GRADLE_HOME=/usr/local/opt/gradle/libexec

# load local settings
for f in `find ~/.zshrc.d/*`; do . $f ; done
