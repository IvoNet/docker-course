#!/usr/bin/env bash

###NOTES!!!
#Make this script executable
# chmod 755 setup.sh
#create a glassfish-pwd.txt file in the root of this project containing this text with pwd ofcourse and without the #.
#AS_ADMIN_PASSWORD=

docker-compose -f ../docker-compose.yml stop payara

mvn clean dependency:copy-dependencies -f ./setup-pom.xml

#cp ./setup.sql ../volumes/testdata/mysql/
#cp ./setup-test.sql ../volumes/testdata/mysql/


#remove possible existing postgres jars from glassfish domain lib

# Copy the postgres lib to glassfish
cp ./target/dependency/mysql-connector-java*.jar ../volumes/payara/lib

docker-compose -f ../docker-compose.yml start payara


# Delete the connection pool if it exists
docker-compose exec payara /opt/payara41/bin/asadmin --user admin --passwordfile /opt/pwdfile delete-jdbc-resource jdbc/quote_db
docker-compose exec payara /opt/payara41/bin/asadmin --user admin --passwordfile /opt/pwdfile delete-jdbc-connection-pool quote_dbConnectionPool

# When MySQL
## Create a JDBC Connection Pool
docker-compose exec payara /opt/payara41/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.ConnectionPoolDataSource --property portNumber=3306:password=secret:user=root:serverName=mysql:databaseName=quote quote_dbConnectionPool
docker-compose exec payara /opt/payara41/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-resource --connectionpoolid quote_dbConnectionPool jdbc/quote_db

#Cleanup
#mvn clean

docker-compose -f ../docker-compose.yml stop payara
docker-compose -f ../docker-compose.yml start payara

echo "===Finished==="
