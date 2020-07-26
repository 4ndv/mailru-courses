# Courses

[![Build Status](https://travis-ci.com/4ndv/mailru-courses.svg?branch=master)](https://travis-ci.com/4ndv/mailru-courses)

## Installation

Required ruby version: 2.6.3

Required tools: docker-compose, foreman

Steps to install locally:

```bash
gem install foreman
bundle install
docker-compose up
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

## Running tests locally

```bash
foreman run --env .env.test bundle exec rspec -f doc
```
