## wisr-take-home-test
Data files and questions can be downloaded [here](https://drive.google.com/file/d/1fttbeo9_ueXdqNK54s0zshxqoaqauDWB/view?usp=sharing)

### MySQL Version
This take-home test was developed and tested using MySQL version 5.7.24.

## Instructions
### Q1:
[Q1-ERD.ipynb](https://github.com/samrere/wisr-take-home-test/blob/main/Q1-ERD.ipynb): This file performs pre-checks on the data, determines cardinality between tables, and finally displays the ERD.

### Q2:
Before running the files:
* Log in to the MySQL server as the root user and create a new user with basic SELECT permissions,
* Create a database called 'wisr'.

Run [Q2-create-schema.sql](https://github.com/samrere/wisr-take-home-test/blob/main/Q2-create-schema.sql) first: This file creates table schemas and defines constraints such as primary keys, foreign keys, and CHECK constraints. It also loads data into the titles and employees tables, then sets emp_no to AUTO INCREMENT starting from MAX(emp_no) + 1.

Next, run [Q2-load-data.sql](https://github.com/samrere/wisr-take-home-test/blob/main/Q2-load-data.sql) to load CSV data into the remaining tables.

### Q3:
Log in to the MySQL server using the credentials of the newly created user with SELECT permissions.

Run [Q3-queries.sql](https://github.com/samrere/wisr-take-home-test/blob/main/Q3-queries.sql) to execute all the queries.
