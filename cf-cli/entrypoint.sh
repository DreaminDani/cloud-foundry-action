#!/bin/sh -l


if [ -n "$CF_USERNAME" ] && [ -n "$CF_PASSWORD" ]; then
  cf auth
fi

sh -c "cf $*"
