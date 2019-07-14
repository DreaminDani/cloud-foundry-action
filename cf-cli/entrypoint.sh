#!/bin/sh -l


if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  cf api "https://api.run.pivotal.io"
  cf auth "$CF_USERNAME" "$CF_PASSWORD"
fi

sh -c "cf $*"
