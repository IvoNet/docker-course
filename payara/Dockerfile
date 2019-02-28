FROM localhost:5000/payara

LABEL maintainer="IvoNet"

COPY ./target/dependency/mysql-connector-java-5.1.47.jar /opt/mysql-connector-java-5.1.47.jar
ARG PWD
ENV PASSWORD $PWD
RUN  echo "AS_ADMIN_PASSWORD=${PASSWORD}">/opt/pwd.txt \
  && /opt/payara5/bin/asadmin start-domain domain1 \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt add-library /opt/mysql-connector-java-5.1.47.jar \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.ConnectionPoolDataSource --property portNumber=3306:password=secret:user=root:serverName=mysql:databaseName=quote:useSSL=false quote_dbConnectionPool \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt create-jdbc-resource --connectionpoolid quote_dbConnectionPool jdbc/quote_db \
  && /opt/payara5/bin/asadmin stop-domain domain1 \
  && rm -f /opt/pwd.txt
