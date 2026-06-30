FROM debian:trixie-slim

# Install OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server \
    inetutils-ping \
    iproute2 \
    curl

RUN useradd -m test1 -u 10000
RUN useradd -m test2 -u 10001

COPY server/etc/ssh/sshd_config.d/99-authorized-keys-command.conf /etc/ssh/sshd_config.d/99-authorized-keys-command.conf
COPY server/get-authorized-keys.sh /get-authorized-keys.sh

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D", "-e"]