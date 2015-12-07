#!/bin/bash
#: Title       : minjs
#: Date        : 2015-11-22
#: Author      : "Ezequiel S. Pereira" <ezequielsp@hotmail.com.br>
#: Version     : 0.0.2
#: Description : Call the closure compiler to minify js. 
# Takes a filename myjs.x.y.js and outputs myjs.x.y.min.js, a minified version.

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.
CLOSURE_COMPILER=/usr/local/jar/closure-compiler.jar

# Initialize our own variables:
output_file=""

USAGE="Usage: minjs -o myfile file1.js file2.js file3.js ... fileN.js"

if [ "$#" -eq 0 ]; then
	echo "$USAGE"
	exit 1
fi

while getopts "o:" opt; do
    case "$opt" in
      o) output_file=$OPTARG ;;
    esac
done
shift $((OPTIND-1))

[ "$1" = "--" ] && shift
for i in $@; 
  do 
    if [ ! -f $i ] 
    	then  
		echo "Input file $i does not exist"
		exit 1;
	fi
done;

minjsFilePath="$output_file.min.js"
if [ "$#" -gt 0 ]
	then
	java -jar $CLOSURE_COMPILER $@ > $minjsFilePath
	echo "$@  minified. Now located at $minjsFilePath"
fi