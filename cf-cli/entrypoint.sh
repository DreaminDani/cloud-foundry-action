#!/bin/sh -l

if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  export CF_USERNAME=$CF_USERNAME
  export CF_PASSWORD=$CF_PASSWORD

  cf api "https://api.run.pivotal.io"
  cf auth
fi

sh -c "cf $*"
