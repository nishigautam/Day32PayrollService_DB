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

#UC3

mysql> INSERT INTO employee_payroll (name, salary, start) VALUES
    -> ('Bill', 650000.00, '2020-12-30'),
    -> ('Terissa', 430000.00, '2021-09-20'),
    -> ('Charlie', 780000.00, '2018-01-16');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

#UC4

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | Bill    | 650000 | 2020-12-30 |
|  2 | Terissa | 430000 | 2021-09-20 |
|  3 | Charlie | 780000 | 2018-01-16 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)
