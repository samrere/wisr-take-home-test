-- Use database wisr
USE wisr;

-- Drop tables. Drop child tables first
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

-- Create tables with PK only (so order of creation doesn't matter)
CREATE TABLE departments (
    dept_no CHAR(4),
    dept_name VARCHAR(50) NOT NULL
);
ALTER TABLE departments ADD CONSTRAINT dept_pk PRIMARY KEY (dept_no);
ALTER TABLE departments ADD CONSTRAINT check_dept_pk_len CHECK (LENGTH(dept_no) = 4);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(4)
);
ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_pk PRIMARY KEY (emp_no, dept_no);

CREATE TABLE dept_manager (
    emp_no INT,
    dept_no CHAR(4)
);
ALTER TABLE dept_manager ADD CONSTRAINT dept_manager_pk PRIMARY KEY (emp_no, dept_no);

CREATE TABLE employees (
    emp_no INT,
    emp_title_id CHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);
ALTER TABLE employees ADD CONSTRAINT emp_pk PRIMARY KEY (emp_no);
ALTER TABLE employees ADD CONSTRAINT check_emp_sex CHECK (sex IN ('M', 'F'));
CREATE INDEX idx_hire_date ON employees(hire_date);
CREATE INDEX idx_name ON employees(last_name, first_name);

CREATE TABLE salaries (
    emp_no INT,
    salary DECIMAL(10, 2) NOT NULL
);
ALTER TABLE salaries ADD CONSTRAINT salary_pk PRIMARY KEY (emp_no);

CREATE TABLE titles (
    title_id CHAR(5),
    title VARCHAR(50) NOT NULL
);
ALTER TABLE titles ADD CONSTRAINT title_pk PRIMARY KEY (title_id);
ALTER TABLE titles ADD CONSTRAINT check_title_pk_len CHECK (LENGTH(title_id) = 5);

-- Now add foreign key constraints
ALTER TABLE dept_emp ADD CONSTRAINT dept_dept_emp FOREIGN KEY (dept_no) REFERENCES departments (dept_no);
ALTER TABLE dept_emp ADD CONSTRAINT emp_dept_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT dept_dept_manager FOREIGN KEY (dept_no) REFERENCES departments (dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT emp_dept_manager FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT emp_salaries FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT titles_emp FOREIGN KEY (emp_title_id) REFERENCES titles (title_id);
