FROM python:3.9.10

ARG USERNAME=pythonssh

RUN apt update && \
    apt -y install openssh-server whois && \
    useradd -ms /bin/bash $USERNAME && \
    apt purge -y whois && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

USER $USERNAME
RUN mkdir /home/$USERNAME/.ssh && \
    touch /home/$USERNAME/.ssh/authorized_keys
USER root

VOLUME /home/$USERNAME/.ssh
VOLUME /etc/ssh

CMD ["/app/entrypoint.sh"]
