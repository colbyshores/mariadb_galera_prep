#!/usr/bin/bash
DATABASES=$(mysql -ANe"SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('mysql','information_schema','performance_schema')")
for D in $DATABASES
do
  TABLES=$(mysql -p$2 -u$1 --skip-column-names -B -D $D -e 'show tables')
  for T in $TABLES
  do
    echo "Processing $T in $D"
    mysql -p$2 -u$1 -D $D -e "SET FOREIGN_KEY_CHECKS=0;ALTER TABLE $T ENGINE=INNODB;SET FOREIGN_KEY_CHECKS=1;"
  done
done
