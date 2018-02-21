FROM mysql:5.7.16
MAINTAINER Ivo Woltring <webmaster@ivonet.nl>

ENV TEST_DIR=/testdata

COPY setup /usr/local/bin/
RUN ln -s /usr/local/bin/vod-entrypoint.sh /vod-entrypoint.sh; \
    ln -s /usr/local/bin/testdata-watcher.sh /testdata-watcher.sh; \
    chmod +x /vod-entrypoint.sh /testdata-watcher.sh; \
    apt-key adv --keyserver pgp.mit.edu --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5; \
    apt-get update; \
    apt-get install -y inotify-tools; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["$TEST_DIR"]
ENTRYPOINT ["my-entrypoint.sh"]
CMD ["mysqld"]