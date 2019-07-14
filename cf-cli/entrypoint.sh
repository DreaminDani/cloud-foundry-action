#!/bin/sh -l


if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  cf login -a "https://api.run.pivotal.io" -u $CF_USERNAME -p $CF_PASSWORD
fi

sh -c "cf $*"
