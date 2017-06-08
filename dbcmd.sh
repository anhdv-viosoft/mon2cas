if [ "$1" == "flush" ];then
    /opt/apache-cassandra-3.9/bin/cqlsh 10.10.10.7 -e "drop keyspace validium_testresult; CREATE KEYSPACE validium_testresult WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };"
    ./flushdb.sh
elif [ "$1" == "desc" ]; then
    /opt/apache-cassandra-3.9/bin/cqlsh 10.10.10.7 -e "use validium_testresult; desc tables"
elif [ "$1" == "cmd" ]; then
   /opt/apache-cassandra-3.9/bin/cqlsh 10.10.10.7
else
  if [ "$2" != "" ]; then
    TBL=$2
  else
    TBL='executinglogs'
  fi
  /opt/apache-cassandra-3.9/bin/cqlsh 10.10.10.7 -e "use validium_testresult; select * from $TBL"
fi
