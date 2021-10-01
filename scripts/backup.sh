#!/bin/bash

# https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes

if [ -z "$1" ]; then
    echo "No argument"
    exit 1
fi

# DATE=$(date '+%Y-%m-%d')
# BACKUP_DIR="${1}/${DATE}"
BACKUP_DIR=$1
mkdir $BACKUP_DIR
# rm -r "${BACKUP_DIR}"/*

docker stop nexus

docker run --rm -v nexus-data:/data -v $BACKUP_DIR:/backup ubuntu tar czvf /backup/nexus-data.tar.gz /data

docker start nexus