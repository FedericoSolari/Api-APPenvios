#!/bin/sh
bundle install
bundle exec rake db:migrate
APP_ENV=test bundle exec rake
