FROM ruby:2.6

ENV LANG C.UTF-8
ENV BUNDLE_GEMFILE=/app/Gemfile

RUN apt-get update && apt-get install -y apt-utils build-essential libpq-dev postgresql-client
# RUN apt-get update -qq && \
#  apt-get install -y --no-install-recommends \
#   build-essential \
#   libpq-dev \
#   libfontconfig1 && \
#   rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
  (curl -sL https://deb.nodesource.com/setup_11.x | bash -) && \
  apt-get update && apt-get install -y nodejs

WORKDIR /app

RUN gem update bundler

RUN bundle config --local build.nokogiri --use-system-libraries && \
bundle config --local job 10