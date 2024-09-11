# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Bundle install MySQL

```.sh
gem install mysql2 -v 0.5.6 -- --with-ldflags=-L$(brew --prefix zstd)/lib

bundle config --local build.mysql2 "--with-ldflags=-L$(brew --prefix zstd)/lib"

bundle install
```
