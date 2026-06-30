FROM debian:trixie-slim

# Install OpenSSH client
RUN apt-get update && apt-get install -y openssh-client inetutils-ping iproute2

COPY client/generate-signed-key.sh /generate-signed-key.sh

RUN mkdir -p /root/.ssh;\
    chmod 700 /root/.ssh;

COPY client/root/.ssh/config /root/.ssh/config

CMD ["sleep", "infinity"]
