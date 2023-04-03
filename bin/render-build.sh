#!/usr/bin/env bash
# exit on error
set -o errexit

rvm install 3.2.2
rvm use 3.2.3 --default
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
