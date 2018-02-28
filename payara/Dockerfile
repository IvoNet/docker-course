FROM localhost:5000/payara

MAINTAINER IvoNet

COPY ./target/dependency/mysql-connector-java-5.1.42.jar /opt/payara41/glassfish/domains/domain1/lib

RUN  /opt/payara41/bin/asadmin start-domain domain1 \
  && /opt/payara41/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.ConnectionPoolDataSource --property portNumber=3306:password=secret:user=root:serverName=mysql:databaseName=quote quote_dbConnectionPool \
  && /opt/payara41/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-resource --connectionpoolid quote_dbConnectionPool jdbc/quote_db \
  && /opt/payara41/bin/asadmin stop-domain domain1
