FROM ruby:3.2-rc
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /rails-tech-test
COPY Gemfile /rails-tech-test/Gemfile
COPY Gemfile.lock /rails-tech-test/Gemfile.lock

RUN bundle check || bundle install

COPY . ./

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
