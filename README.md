# DB Backup

Edit crontab on your system with `crontab -e` command. Add following settings to enable backup at 3 in the morning.
```
0 3 * * * root /backup/mysql-backup.sh
```
