FROM ruby:2.2.5-alpine

RUN apk update && apk add make g++ postgresql-dev

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "main.rb"]