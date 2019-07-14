#!/bin/sh -l

if [ -n "$CF_API" ]; then
  cf api "$CF_API"
else
  cf api "https://api.run.pivotal.io"
fi

if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  cf auth "$CF_USERNAME" "$CF_PASSWORD"
fi

if [ -n "$CF_TARGET" ] then
  cf target "$CF_TARGET"
fi

sh -c "cf $*"
