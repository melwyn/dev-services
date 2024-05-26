ARG RUBY_VERSION=3.3.1

FROM ruby:${RUBY_VERSION}

# RUN mkdir -p /usr/local/share/ca-certificates
# COPY ssl/*.crt /usr/local/share/ca-certificates

RUN update-ca-certificates \
 && apt-get update && apt-get install -y nodejs zlib1g-dev liblzma-dev patch libxml2 \
 && git config --global --add safe.directory '*'

RUN mkdir -p /var/www/rails

ADD docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]

WORKDIR /var/www/rails
