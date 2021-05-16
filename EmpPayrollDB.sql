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

#UC5

mysql> SELECT salary FROM employee_payroll WHERE name = 'Bill';
+--------+
| salary |
+--------+
| 650000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | Bill    | 650000 | 2020-12-30 |
|  3 | Charlie | 780000 | 2018-01-16 |
+----+---------+--------+------------+
2 rows in set (0.01 sec)

#UC6

mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.19 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'M' WHERE name='Bill' or name='Charlie';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE employee_payroll SET gender = 'F' WHERE name='Terissa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll SET salary = 7000000.00 WHERE name='Terissa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------+---------+------------+
| id | name    | gender | salary  | start      |
+----+---------+--------+---------+------------+
|  1 | Bill    | M      |  650000 | 2020-12-30 |
|  2 | Terissa | F      | 7000000 | 2021-09-20 |
|  3 | Charlie | M      |  780000 | 2018-01-16 |
+----+---------+--------+---------+------------+
3 rows in set (0.00 sec)
