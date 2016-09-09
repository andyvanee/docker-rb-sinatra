FROM ruby:2.3

MAINTAINER Andy Vanee <andy@andyvanee.com>

ENV RACK_ENV production
ENV APP_FILE app.rb

RUN gem install sinatra
RUN gem install thin
RUN gem install shotgun

RUN mkdir -p /usr/src/app

ADD startup.sh /

WORKDIR /usr/src/app

EXPOSE 80

CMD ["/bin/bash", "/startup.sh"]
