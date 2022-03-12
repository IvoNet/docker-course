#!/usr/bin/env bash
export LOG=$TEST_DIR/"testdata.$(date +"%y-%m-%d").log"
echo "Starting MySQL with Testdata dir [$TEST_DIR] and Logfile [$LOG]"
mkdir -p $TEST_DIR 2>/dev/null
chmod 777 $TEST_DIR
chmod 777 /docker-entrypoint-initdb.d
chmod 666 /docker-entrypoint-initdb.d/*
exec /testdata-watcher.sh </dev/null >>$LOG 2>&1 &
exec "/entrypoint.sh" "$@"
