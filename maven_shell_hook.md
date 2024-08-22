export JAVA_HOME=$(readlink -e $(type -p javac) | sed  -e 's/\/bin\/javac//g')
export JAVA_HOME="${$(readlink -e $(type -p java))%*/bin/java}"
