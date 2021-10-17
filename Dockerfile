FROM ruby:3.0.2

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee \
  /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn locales

WORKDIR /app
RUN gem install bundler -v '~> 2.2.3'
ADD Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install
