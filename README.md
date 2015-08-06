# zabbix_clear_data
zabbix清理数据



mysql> use zabbix;

Reading table information for completion of table and column names

You can turn off this feature to get a quicker startup with -A

Database changed

mysql> desc history;

+--------+---------------------+------+-----+---------+----------------+

| Field  | Type                | Null | Key | Default | Extra          |

+--------+---------------------+------+-----+---------+----------------+

| id     | int(11)             | NO   | PRI | NULL    | auto_increment |

| itemid | bigint(20) unsigned | NO   | MUL | NULL    |                |

| clock  | int(11)             | NO   | MUL | 0       |                |

| value  | double(16,4)        | NO   |     | 0.0000  |                |

| ns     | int(11)             | NO   |     | 0       |                |

+--------+---------------------+------+-----+---------+----------------+

5 rows in set (0.00 sec)


mysql> desc history_uint;

+--------+---------------------+------+-----+---------+----------------+

| Field  | Type                | Null | Key | Default | Extra          |

+--------+---------------------+------+-----+---------+----------------+

| id     | int(11)             | NO   | PRI | NULL    | auto_increment |

| itemid | bigint(20) unsigned | NO   | MUL | NULL    |                |

| clock  | int(11)             | NO   | MUL | 0       |                |

| value  | bigint(20) unsigned | NO   |     | 0       |                |

| ns     | int(11)             | NO   |     | 0       |                |

+--------+---------------------+------+-----+---------+----------------+

5 rows in set (0.00 sec)
