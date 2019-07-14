FROM debian:stable-slim

LABEL "com.github.actions.name"="Deploy to PCF"
LABEL "com.github.actions.description"="Pivotal Cloud Foundry Deploy"
LABEL "com.github.actions.icon"="upload-clouud"
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