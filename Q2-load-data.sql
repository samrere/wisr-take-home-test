-- Use database wisr
USE wisr;

-- Show allowed location to load data, copy all CSV files there 
SHOW VARIABLES LIKE 'secure_file_priv';

-- Load tables, insert to parent tables first
LOAD DATA INFILE '/var/lib/mysql-files/salaries.csv'
INTO TABLE salaries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/var/lib/mysql-files/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '/var/lib/mysql-files/dept_manager.csv'
INTO TABLE dept_manager
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (dept_no, emp_no);

LOAD DATA INFILE '/var/lib/mysql-files/dept_emp.csv'
INTO TABLE dept_emp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (emp_no, dept_no);
