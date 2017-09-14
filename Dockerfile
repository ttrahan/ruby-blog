FROM ruby:2.3.4-jessie

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN apt-get update && apt-get -y install nodejs

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD $SHIPPABLE_BUILD_DIR/. /usr/src/app
RUN bundle install

EXPOSE 8080
EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-d", "-b", "0.0.0.0"]
