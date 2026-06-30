FROM debian:trixie-slim

# Install OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server inetutils-ping iproute2

RUN useradd -m test1 -u 10000
RUN useradd -m test2 -u 10001

# RUN mkdir -p /home/test1/.ssh;\
#     chown test1:test1 /home/test1/.ssh;\
#     chmod 700 /home/test1/.ssh

# COPY ca/test1/.ssh/authorized_keys /home/test1/.ssh/authorized_keys
# RUN chown test1:test1 /home/test1/.ssh/authorized_keys;\
#     chmod 600 /home/test1/.ssh/authorized_keys

# RUN mkdir -p /home/test2/.ssh;\
#     chown test2:test2 /home/test2/.ssh;\
#     chmod 700 /home/test2/.ssh

# COPY ca/test2/.ssh/authorized_keys /home/test2/.ssh/authorized_keys
# RUN chown test2:test2 /home/test2/.ssh/authorized_keys;\
#     chmod 600 /home/test2/.ssh/authorized_keys

COPY server/etc/ssh/sshd_config.d/99-authorized-keys-command.conf /etc/ssh/sshd_config.d/99-authorized-keys-command.conf
COPY server/get-authorized-keys.sh /get-authorized-keys.sh

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D", "-e"]