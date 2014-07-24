[![Build Status](https://travis-ci.org/sam-glad/clm.svg?branch=master)](https://travis-ci.org/sam-glad/clm) [![Code Climate](https://codeclimate.com/github/sam-glad/clm.png)](https://codeclimate.com/github/sam-glad/clm) [![Coverage Status](https://coveralls.io/repos/sam-glad/clm/badge.png)](https://coveralls.io/r/sam-glad/clm)

Craigmonster

Craigmonster is a web app which saves Craigslist searches (associated with users who register through Devise) and runs them daily, at randomized times, as background jobs, thanks to Sidekiq and Sidetiq.
Unfortunately, it does not work in production due to Craigslist's having blocked Heroku's IP address, though it works quite well in development. With this in mind, I aim to package a version of this which users will be able to run on their own machines. This will be the goal for after I have polished up the last features of Craigmonster.

The following features are planned for the near future:
-A feedback link through which users will be able to report bugs or send other comments to myself through the website (via ActionMailer)
