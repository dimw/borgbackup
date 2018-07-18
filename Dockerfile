FROM ubuntu:18.04

ENV BORG_RSH="ssh -i /borgbackup/id_rsa -o StrictHostKeyChecking=no"
ENV BORG_PASSPHRASE="secret-passphrase"

ENV LANG="en_US.UTF-8"

RUN apt-get update \
    && apt-get install -y ssh locales borgbackup \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENTRYPOINT ["borg"]
CMD ["--version"]
