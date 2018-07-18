FROM ubuntu:18.04

ENV BORG_RSH="ssh -i /borgbackup/id_rsa -o StrictHostKeyChecking=no"
ENV BORG_PASSPHRASE="secret-passphrase"

ENV LANG="en_US.UTF-8"

RUN apt-get update \
    && apt-get install -y ssh locales borgbackup \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["borg"]
CMD ["--version"]
