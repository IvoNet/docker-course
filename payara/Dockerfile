FROM localhost:5000/payara

ARG PWD
LABEL maintainer="IvoNet.nl"
ENV MYSQL_VERION="5.1.47"

ENV PASSWORD ${PWD:-secret}
RUN  echo "AS_ADMIN_PASSWORD=${PASSWORD}">/opt/pwd.txt \
  && curl -s "http://central.maven.org/maven2/mysql/mysql-connector-java/$MYSQL_VERION/mysql-connector-java-$MYSQL_VERION.jar" -o "/opt/mysql-connector-java-$MYSQL_VERION.jar" \
  && /opt/payara5/bin/asadmin start-domain domain1 \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt add-library "/opt/mysql-connector-java-$MYSQL_VERION.jar" \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.ConnectionPoolDataSource --property portNumber=3306:password=secret:user=root:serverName=mysql:databaseName=quote:useSSL=false quote_dbConnectionPool \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt create-jdbc-resource --connectionpoolid quote_dbConnectionPool jdbc/quote_db \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.ConnectionPoolDataSource --property portNumber=3306:password=secret:user=root:serverName=mysql:databaseName=kwetter:useSSL=false kwetter_dbConnectionPool \
  && /opt/payara5/bin/asadmin --user admin --passwordfile /opt/pwd.txt create-jdbc-resource --connectionpoolid kwetter_dbConnectionPool jdbc/kwetter_db \
  && /opt/payara5/bin/asadmin stop-domain domain1 \
  && rm -f "/opt/pwd.txt" "/opt/mysql-connector-java-$MYSQL_VERION.jar"
