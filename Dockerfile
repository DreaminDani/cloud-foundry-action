FROM debian:stable-slim

LABEL "com.github.actions.name"="Pivotal Cloud Foundry (PCF) CLI"
LABEL "com.github.actions.description"="Deploy and Manage PWS, PCF, and Pivotal services using the latest version of the cf cli"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/d3sandoval/cloud-foundry-action"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Daniel E. Sandoval <daniel@desandoval.net>"

RUN apt-get update
RUN apt-get install -y ca-certificates uuid-runtime jq

ADD https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github /tmp/cf-cli.tgz

RUN mkdir -p /usr/local/bin && \
    tar -xzf /tmp/cf-cli.tgz -C /usr/local/bin && \
    cf --version

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
