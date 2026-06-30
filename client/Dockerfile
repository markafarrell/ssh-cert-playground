FROM debian:trixie-slim

# Install OpenSSH client
RUN apt-get update && apt-get install -y openssh-client \
    inetutils-ping \
    iproute2 \
    curl \
    jq

COPY client/certs/* /usr/local/share/ca-certificates/

RUN update-ca-certificates

RUN curl -L https://github.com/openbao/openbao/releases/download/v2.5.5/bao_2.5.5_Linux_x86_64.tar.gz | tar xvzf - "bao"; \
    mv bao /usr/local/bin

COPY client/generate-signed-key.sh /generate-signed-key.sh

COPY client/configure-openbao.sh /configure-openbao.sh
COPY client/generate-openbao-signed-key.sh /generate-openbao-signed-key.sh

RUN mkdir -p /root/.ssh;\
    chmod 700 /root/.ssh;

COPY client/root/.ssh/config /root/.ssh/config

CMD ["sleep", "infinity"]
