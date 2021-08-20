# Backup
docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > twitter_backend_project.sql

# Restore
cat twitter_backend_project.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE