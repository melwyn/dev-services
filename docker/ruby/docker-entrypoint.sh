#!/bin/bash

function setup() {
  gem install bundler -v $(tail -n1 Gemfile.lock | xargs)
  bin/setup
}

case "$1" in
  web)
    setup
    rm tmp/pids/server.pid || true
    exec bin/rails server -b 0.0.0.0 -p 80
  ;;

  delayed_jobs)
    setup
    exec rake jobs:work
  ;;

  subscriber)
    setup
    exec bin/subscriber
  ;;

  *)
    exec $@
  ;;
esac
