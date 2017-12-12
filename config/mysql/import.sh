#!/bin/sh
#
# Set the correct file permissions for Magento 2

DATABASE_ROOT_PASSWORD=$1
DATABASE_USER=$2
DATABASE_PASSWORD=$3
DATABASE_NAME=$4

 /usr/bin/mysqld_safe & sleep 5s

mysql -uroot -p${DATABASE_ROOT_PASSWORD} -e "SET GLOBAL show_compatibility_56 = ON;"

# Import Magento database
mysql -uroot -p${DATABASE_ROOT_PASSWORD} -e "DROP DATABASE IF EXISTS ${DATABASE_NAME};"
mysql -uroot -p${DATABASE_ROOT_PASSWORD} -e "CREATE DATABASE ${DATABASE_NAME};"

for SQL_FILE in /docker-entrypoint-initdb.d/*.sql
do
	mysql -u root -p${DATABASE_ROOT_PASSWORD} ${DATABASE_NAME} < ${SQL_FILE} 
done

mysql -uroot -p${DATABASE_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"