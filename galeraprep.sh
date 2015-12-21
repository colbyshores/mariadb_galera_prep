#!/usr/bin/bash
echo "" > altertable.log
DATABASES=$(mysql -ANe"SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('mysql','information_schema','performance_schema')")
for D in $DATABASES
do
  TABLES=$(mysql --skip-column-names -B -D $D -e "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = '$D' AND engine = 'MyISAM';")
  for T in $TABLES
  do
    echo "Processing $T in $D" >> altertable.log
    mysql -e "SET FOREIGN_KEY_CHECKS=0;" >> altertable.log
    mysql -D $D -e "ALTER TABLE $T ENGINE=INNODB;" >> altertable.log
    mysql -e "SET FOREIGN_KEY_CHECKS=1;" >> altertable.log
    mysql -e "use $D;show table status like '$T'\G;" >> altertable.log
  done
done
