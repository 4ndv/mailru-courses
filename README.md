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

Start app:

```bash
foreman start
```

## Running tests locally

Setup:

```bash
foreman run --env .env.test bin/rails db:create
foreman run --env .env.test bin/rails db:migrate
```

Run:

```bash
foreman run --env .env.test bundle exec rspec -f doc
```
