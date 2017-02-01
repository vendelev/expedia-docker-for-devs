#!/bin/bash --login

git checkout --orphan gh-pages

rvm use 2.2.1
#if `bundle --version > /dev/null 2>&1`; then echo "bundler is installed"; else gem install bundler; fi

#bundler install
OUTPUT_DIR="$PWD/public"
rm -f $OUTPUT_DIR/*.html


echo "Generate asciidoctor documentation"
rake generate_lesson[$OUTPUT_DIR,"lesson-0",true]
rake generate_lesson[$OUTPUT_DIR,"lesson-0",false]
rake generate_lesson[$OUTPUT_DIR,"lesson-1",true]
rake generate_lesson[$OUTPUT_DIR,"lesson-1",false]
rake generate_course[$OUTPUT_DIR,true]
rake generate_course[$OUTPUT_DIR,false]

echo "Publish to ewegithub pages"
git add public/
git commit public/ -m "Publish new version"
git push origin `git subtree split --prefix public gh-pages`:refs/heads/gh-pages --force
git checkout master
git branch -D gh-pages
