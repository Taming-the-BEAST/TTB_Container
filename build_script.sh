#!/bin/bash

cd /ttb

rm -rf blotter
git clone --depth 1 https://github.com/tgvaughan/blotter.git

cd /ttb/blotter
bundle install

ruby _scripts/update-and-preprocess.rb

if bundle exec jekyll build; then
    rm -rf /ttb/site
    cp -R /ttb/blotter/_site /ttb/site
fi
