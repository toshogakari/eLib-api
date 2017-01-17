#!/bin/sh
set -ex

if [ "$1" = "bash" ]; then
    exec "bash"
fi

if [ "$1" = "sh" ]; then
    exec "sh"
fi

if [ "$1" = "rails" -o "$2" = "rails" ]; then
    RAILS_VERSION=$(bundle exec rails -v | awk '{print $2}' | tr '.' ' ' | awk '{print $1}')
    if [[ -n $DB_HOST ]]; then
      dockerize -wait tcp://$DB_HOST:$DB_PORT -wait tcp://$ELASTIC_HOST:$ELASTIC_PORT -wait tcp://$REDIS_HOST:$REDIS_PORT -timeout 300s
    fi
    if [ $RAILS_VERSION -ge 5 ]; then
      rails db:migrate
    else
      rake db:migrate
    fi
    exec "$@"
fi
