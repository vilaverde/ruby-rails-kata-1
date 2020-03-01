FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs \
    locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN mkdir /ruby-rails-kata-1

WORKDIR /ruby-rails-kata-1

ADD Gemfile /ruby-rails-kata-1/Gemfile

ADD Gemfile.lock /ruby-rails-kata-1/Gemfile.lock

RUN gem install bundler

RUN bundle install

ADD . /ruby-rails-kata-1
