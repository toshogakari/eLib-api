FROM ruby:2.3.3-alpine
MAINTAINER Tsukasa Arima

ARG DOCKERIZE_VERSION=v0.3.0
ENV RAILS_ENV=production PATH=/usr/src/app/bin:$PATH

COPY docker-entrypoint.sh /usr/local/bin/

RUN set -x \
    && mkdir -p /usr/src/app \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh \
    && apk add --update --upgrade --no-cache --virtual .rails-dependency-packages \
        ruby-dev zlib-dev libxml2-dev libxml2-utils libxslt-dev tzdata yaml-dev \
        readline-dev libpq bash \
    && apk add --update --upgrade --no-cache --virtual .dockerize-packages \
        ca-certificates wget \
    && wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && apk del .dockerize-packages

ONBUILD COPY app/Gemfile* /usr/src/app/

WORKDIR /usr/src/app

ONBUILD RUN set -x \
    && apk add --update --upgrade --no-cache --virtual .build-packages openssl-dev \
        ca-certificates wget curl-dev build-base alpine-sdk linux-headers paxctl \
        make gcc g++ libgcc libstdc++ gnupg postgresql-dev \
    && cd /usr/src/app \
    && gem update --system \
    && gem update bundler \
    && CPU_CORES="$(cat /proc/cpuinfo | grep "cpu cores" | wc -l)" \
    && bundle install --jobs=${CPU_CORES} --without development test \
    && apk del .build-packages

ONBUILD COPY app /usr/src/app

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["unicorn", "-c", "/usr/src/app/config/unicorn.rb", "-E", "production", "-p", "9000", "-o", "0.0.0.0"]

EXPOSE 9000
