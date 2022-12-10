#!/bin/bash
rm -rf dist/
mkdir dist
mkdir dist/css
mkdir dist/js

echo "dist folder reset"

HTML_FILE_NAME="index.html"
CSS_FILE_NAME1="index.css"
CSS_FILE_NAME2="bootstrap.css"
JS_FILE_NAME="index.js"


html-minifier --collapse-whitespace $HTML_FILE_NAME -o dist/$HTML_FILE_NAME
echo "$HTML_FILE_NAME minified"

cssnano css/$CSS_FILE_NAME1 dist/css/$CSS_FILE_NAME1
echo "$CSS_FILE_NAME1 minified"

cssnano css/$CSS_FILE_NAME2 dist/css/$CSS_FILE_NAME2
echo "$CSS_FILE_NAME2 minified"

uglifyjs --compress --mangle -o dist/js/$JS_FILE_NAME -- js/$JS_FILE_NAME
echo "$JS_FILE_NAME minified"

cp -r ./img ./dist/img
cp -r ./files ./dist/files

echo "Minification complete!"