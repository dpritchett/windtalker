FROM ruby:2.1.4

RUN apt-get update -qq
RUN apt-get install espeak -qy

ADD Gemfile      /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

WORKDIR          /webapp
RUN              bundle

ADD .            /webapp
