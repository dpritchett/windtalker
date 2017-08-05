FROM ruby:2.3.1

MAINTAINER Daniel J. Pritchett <dpritchett@gmail.com>

RUN apt-get update -qq
RUN apt-get install espeak -qy

ADD Gemfile      /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

WORKDIR          /webapp
RUN              bundle

ADD .            /webapp
