# mariadb_galera_prep
Preps a MyISIAM database to Galera by converting non essential database tables to InnoDB.
This works by stopping replication on an existing slave, copying the data to a new node that will be part of the new Galera cluster.
After starting MariaDB on the new node make sure that mysql_upgrade is run first before running this script.

The first command line argument is for the Hostname and second argument is for the mysql Password


Copyright (c) 2015 Colby Shores. All rights reserved.

Redistribution and use in source and binary forms are permitted provided that the above copyright notice and this paragraph are duplicated in all such forms and that any documentation, advertising materials, and other materials related to such distribution and use acknowledge that the software was developed by the . The name of the may not be used to endorse or promote products derived from this software without specific prior written permission. THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
