#UC1 : Ability to create a payroll service database

mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.01 sec)

mysql> USE payroll_service;
Database changed
mysql> SELECT DATABASE();
+-----------------+
| DATABASE()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)

#UC2

mysql> CREATE TABLE employee_payroll
    -> (
    -> id       INT unsigned NOT NULL AUTO_INCREMENT,
    -> name     VARCHAR(50)  NOT NULL,
    -> salary   DOUBLE       NOT NULL,
    -> start    DATE         NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> SHOW Tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.01 sec)
