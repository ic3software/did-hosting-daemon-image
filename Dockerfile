FROM ubuntu:26.04

ARG DID_HOSTING_DAEMON_VERSION=0.7.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://fpp.ic3.dev/did-hosting-daemon-k8s/${DID_HOSTING_DAEMON_VERSION}/did-hosting-daemon" -o /usr/local/bin/did-hosting-daemon && \
    chmod 0755 /usr/local/bin/did-hosting-daemon

WORKDIR /app/did-hosting-daemon

ENTRYPOINT ["did-hosting-daemon"]
