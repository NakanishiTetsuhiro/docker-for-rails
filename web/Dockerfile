FROM ruby:2.6.0

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-client apt-utils nodejs
RUN gem install rails
RUN mkdir /app
WORKDIR /app

