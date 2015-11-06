# mariadb_galera_prep
Preps a MyISIAM database to Galera by converting non essential database tables to InnoDB.
This works by stopping replication on an existing slave, copying the data to a new node that will be part of the new Galera cluster.
After starting MariaDB on the new node make sure that mysql_upgrade is run first before running this script.

The first command line argument is for the Hostname and second argument is for the mysql Password
