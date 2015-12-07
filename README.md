# minjs

# Minify JS from the command line

$ chmod o+r closure-compiler.jar

$ cp closure-compiler.jar /usr/local/jar/

$ chmod +x minjs

$ sudo mv minjs.sh /usr/local/bin

You can now begin using the minifyjs script to quickly compress JavaScript files.

$ minjs -o myfile file1.js file2.js file3.js ... fileN.js

./testing.js minified. Now located at ./testing.min.js
