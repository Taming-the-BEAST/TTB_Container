#!/bin/bash

rm -rf blotter
git clone --depth 1 https://github.com/tgvaughan/blotter.git

cd blotter
bundle install

ruby _scripts/update-and-preprocess.rb

bundle exec jekyll build