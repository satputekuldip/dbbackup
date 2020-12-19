#!/bin/bash

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`

DB_BACKUP_PATH='/Users/spark/Projects/AutobackupSystem/backup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='password'
DATABASE_NAME='laravel_assesment'
BACKUP_RETAIN_DAYS=30

mkdir -p ${DB_BACKUP_PATH}
echo "Backup started for database - ${DATABASE_NAME}"

mysqldump -h ${MYSQL_HOST} \
-P ${MYSQL_PORT} \
-u ${MYSQL_USER} \
-p${MYSQL_PASSWORD} \
${DATABASE_NAME} > ${DB_BACKUP_PATH}/${DATABASE_NAME}.sql

cd /Users/spark/Projects/AutobackupSystem/backup
git add .
git commit -m "Backup At ${TODAY}"
git push origin master

if [ $? -eq 0 ]; then
  echo "Database backup successfully completed"
else
  echo "Error found during backup"
  exit 1
fi

