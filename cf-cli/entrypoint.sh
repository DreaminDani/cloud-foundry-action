#!/bin/sh -l

if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  CF_USERNAME=$CF_USERNAME
  CF_PASSWORD=$CF_PASSWORD

  cf api "https://api.run.pivotal.io"
  cf auth
fi

sh -c "cf $*"
