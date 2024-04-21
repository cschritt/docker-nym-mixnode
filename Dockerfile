FROM debian:stable-slim@sha256:2c96e0011b1b2855d8e482e6d4ced6d292ea50750e9e535d09510167ae4858f9

ARG VERSION="v2024.1-marabou"

RUN apt-get update \
  && apt-get install --yes --no-install-recommends ca-certificates wget curl openssl libssl-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN wget -q https://github.com/nymtech/nym/releases/download/nym-binaries-${VERSION}/nym-mixnode -O /usr/local/bin/nym-mixnode
RUN chmod +x /usr/local/bin/nym-mixnode

# Create nym user
RUN adduser --system --group --disabled-password --uid 101 --home /home/nym nym

VOLUME /home/nym/.nym

EXPOSE 1789
EXPOSE 1790
EXPOSE 8000

USER nym
ENTRYPOINT ["nym-mixnode"]
