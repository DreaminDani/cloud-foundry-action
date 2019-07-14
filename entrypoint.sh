#!/bin/sh -l

if [ -n "$CF_API" ]; then
  cf api "$CF_API"
else
  cf api "https://api.run.pivotal.io"
fi

if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  cf auth "$CF_USERNAME" "$CF_PASSWORD"
fi

if [ -n "$CF_TARGET_ORG" ] && [ -n "$CF_TARGET_SPACE" ]; then
  cf target -o "$CF_TARGET_ORG" -s "$CF_TARGET_SPACE"
fi

sh -c "cf $*"
