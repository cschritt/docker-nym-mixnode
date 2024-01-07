FROM debian:latest

ARG VERSION="v2023.5-rolo"

RUN apt-get update && apt-get install -y wget curl openssl libssl-dev
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
