FROM ruby:3.0.1-alpine

RUN apk add --update \
    build-base \
    mariadb-dev \
    && rm -rf /var/cache/apk/*

RUN gem install bundler

WORKDIR /myapp
COPY Gemfile* /myapp/
RUN bundle install

WORKDIR /myapp
COPY . /myapp

