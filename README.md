# BorgBackup Dockerized

See [borgbackup.readthedocs.io/en/stable/](https://borgbackup.readthedocs.io/en/stable/) for BorgBackup documentation.

## tl;dr

Init repository:

    docker run -v /path/to/private-ssh-key:/borgbackup/id_rsa \
      repository.gitlab.com/nl2go/ingfrastructure/borgbackup \
      init --encryption=repokey ssh://user123@user123.your-storagebox.de/./backup_$(hostname)

Create backup of some folders:

    docker run -v /path/to/private-ssh-key:/borgbackup/id_rsa \
      -v /folder1:/folder1 \
      -v /folder2:/folder2 \
      repository.gitlab.com/nl2go/ingfrastructure/borgbackup \
      create -v --stats ssh://user123@user123.your-storagebox.de/./backup_$(hostname)::'{now:%Y-%m-%d_%H:%M}' \
      /folder1 /folder2
      
Prune old backups:
   
    docker run -v /path/to/private-ssh-key:/borgbackup/id_rsa \
      repository.gitlab.com/nl2go/ingfrastructure/borgbackup \ 
      borg prune -v --list --keep-daily=7 ssh://user123@user123.your-storagebox.de/./backup_$(hostname)

## Licence

The content of this repository is under the MIT licence.
