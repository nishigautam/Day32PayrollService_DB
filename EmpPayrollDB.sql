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

#UC7

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|      715000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | AVG(salary) |
+--------+-------------+
| M      |      715000 |
| F      |     7000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | COUNT(name) |
+--------+-------------+
| M      |           2 |
| F      |           1 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | SUM(salary) |
+--------+-------------+
| M      |     1430000 |
| F      |     7000000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | MIN(salary) |
+--------+-------------+
| M      |      650000 |
| F      |     7000000 |
+--------+-------------+
2 rows in set (0.01 sec)

mysql> SELECT gender, MAX(salary) FROM employee_payroll GROUP BY gender;
+--------+-------------+
| gender | MAX(salary) |
+--------+-------------+
| M      |      780000 |
| F      |     7000000 |
+--------+-------------+
2 rows in set (0.00 sec)

#UC8

mysql> ALTER TABLE employee_payroll ADD phone_number BIGINT AFTER name;
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD address VARCHAR(100) AFTER phone_number;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD department VARCHAR(100) NOT NULL AFTER address;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------------+---------+------------+--------+---------+------------+
| id | name    | phone_number | address | department | gender | salary  | start      |
+----+---------+--------------+---------+------------+--------+---------+------------+
|  1 | Bill    |         NULL | NULL    |            | M      |  650000 | 2020-12-30 |
|  2 | Terissa |         NULL | NULL    |            | F      | 7000000 | 2021-09-20 |
|  3 | Charlie |         NULL | NULL    |            | M      |  780000 | 2018-01-16 |
+----+---------+--------------+---------+------------+--------+---------+------------+
3 rows in set (0.00 sec)

#UC9

mysql> ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+-----+---------+------------+
| id | name    | phone_number | address | department | gender | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+-----+---------+------------+
|  1 | Bill    |         NULL | NULL    |            | M      |    650000 |          0 |           0 |   0 |       0 | 2020-12-30 |
|  2 | Terissa |         NULL | NULL    |            | F      |   7000000 |          0 |           0 |   0 |       0 | 2021-09-20 |
|  3 | Charlie |         NULL | NULL    |            | M      |    780000 |          0 |           0 |   0 |       0 | 2018-01-16 |
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+-----+---------+------------+
3 rows in set (0.00 sec)

#UC10

mysql> UPDATE employee_payroll SET department = 'Sales' WHERE name = 'Terissa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> INSERT INTO employee_payroll (name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES
    -> ('Terissa', 'Marketing', 'F', 7000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2020-12-30');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM employee_payroll WHERE name = 'Terissa';
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+--------+---------+------------+
| id | name    | phone_number | address | department | gender | basic_pay | deductions | taxable_pay | tax    | net_pay | start      |
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+--------+---------+------------+
|  2 | Terissa |         NULL | NULL    | Sales      | F      |   7000000 |          0 |           0 |      0 |       0 | 2021-09-20 |
|  4 | Terissa |         NULL | TBD     | Marketing  | F      |   7000000 |    1000000 |     2000000 | 500000 | 1500000 | 2020-12-30 |
+----+---------+--------------+---------+------------+--------+-----------+------------+-------------+--------+---------+------------+
2 rows in set (0.00 sec)

#UC11

mysql> CREATE TABLE employee
    -> (
    -> id INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> company_id INT REFERENCES company(company_id),
    -> employee_name VARCHAR(50) NOT NULL,
    -> phone_number BIGINT NOT NULL,
    -> address VARCHAR(100) NOT NULL DEFAULT 'TBD',
    -> gender CHAR(1) NOT NULL
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE payroll
    -> (
    -> emp_id INT REFERENCES employee(id),
    -> basic_pay DOUBLE NOT NULL,
    -> deductions DOUBLE NOT NULL,
    -> taxable_pay DOUBLE NOT NULL,
    -> tax DOUBLE NOT NULL,
    -> net_pay DOUBLE NOT NULL
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE company
    -> (
    -> company_id INT PRIMARY KEY,
    -> company_name VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE department
    -> (
    -> department_id INT PRIMARY KEY,
    -> department_name VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE employee_department
    -> (
    -> emp_id INT REFERENCES employee(id),
    -> department_id INT REFERENCES department(department_id)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO company VALUES
    -> (1,'ABC'),
    -> (2,'BCA'),
    -> (3,'ACB');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM company;
+------------+--------------+
| company_id | company_name |
+------------+--------------+
|          1 | ABC          |
|          2 | BCA          |
|          3 | ACB          |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO employee VALUES
    -> (101, 1, 'Bill', '9832781255', 'California','M'),
    -> (102, 2, 'Terissa', '8956328912', 'San Francisco','F'),
    -> (103, 3, 'Charlie', '7823129021', 'NYC','M');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee;
+-----+------------+---------------+--------------+---------------+--------+
| id  | company_id | employee_name | phone_number | address       | gender |
+-----+------------+---------------+--------------+---------------+--------+
| 101 |          1 | Bill          |   9832781255 | California    | M      |
| 102 |          2 | Terissa       |   8956328912 | San Francisco | F      |
| 103 |          3 | Charlie       |   7823129021 | NYC           | M      |
+-----+------------+---------------+--------------+---------------+--------+
3 rows in set (0.00 sec)

mysql> INSERT INTO payroll VALUES
    -> (101,300000,10000,40000,8000,55000),
    -> (102,900000,51000,23000,80000,120000),
    -> (102,10000,9000,32000,38000,900000);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM payroll;
+--------+-----------+------------+-------------+-------+---------+
| emp_id | basic_pay | deductions | taxable_pay | tax   | net_pay |
+--------+-----------+------------+-------------+-------+---------+
|    101 |    300000 |      10000 |       40000 |  8000 |   55000 |
|    102 |    900000 |      51000 |       23000 | 80000 |  120000 |
|    102 |     10000 |       9000 |       32000 | 38000 |  900000 |
+--------+-----------+------------+-------------+-------+---------+
3 rows in set (0.00 sec)

mysql> INSERT INTO department VALUES
    -> (11, 'Sales'),
    -> (12, 'Marketing'),
    -> (13, 'Testing'),
    -> (14, 'Management');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|            11 | Sales           |
|            12 | Marketing       |
|            13 | Testing         |
|            14 | Management      |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> INSERT INTO employee_department VALUES
    -> (101,13),
    -> (102,12),
    -> (103,11),
    -> (104,14);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_department;
+--------+---------------+
| emp_id | department_id |
+--------+---------------+
|    101 |            13 |
|    102 |            12 |
|    103 |            11 |
|    104 |            14 |
+--------+---------------+
4 rows in set (0.00 sec)

#UC12

mysql> SELECT gender, AVG(net_pay) FROM (employee INNER JOIN payroll ON employee.id=payroll.emp_id) GROUP BY gender;
+--------+--------------+
| gender | AVG(net_pay) |
+--------+--------------+
| M      |        55000 |
| F      |       510000 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT gender, MAX(net_pay) FROM (employee INNER JOIN payroll ON employee.id=payroll.emp_id) GROUP BY gender;
+--------+--------------+
| gender | MAX(net_pay) |
+--------+--------------+
| M      |        55000 |
| F      |       900000 |
+--------+--------------+
2 rows in set (0.00 sec)
