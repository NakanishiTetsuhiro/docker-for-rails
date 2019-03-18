FROM ruby:2.6

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y apt-utils build-essential libpq-dev postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get install -y nodejs

RUN gem install rails
RUN mkdir /app
WORKDIR /app
