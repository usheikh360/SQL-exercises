#-----------------------------------------------------------------EXERCISES FROM: https://www.w3resource.com/mysql-exercises/create-table-exercises/index.php-------------------------------------------
#1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.
CREATE TABLE countries (
country_id int, 
country_name varchar(40),
region_id int,
CONSTRAINT pk_countries PRIMARY KEY (country_id)
);
DESCRIBE countries;

#2. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id which is already exists.
CREATE TABLE IF NOT EXISTS countries (
country_id int, 
country_name varchar(40),
region_id int,
CONSTRAINT fk_countries PRIMARY KEY (country_id)
);
DESCRIBE countries;

#3. Write a SQL statement to create the structure of a table dup_countries similar to countries.#Includes the use of LIKE whilst creating a table
CREATE TABLE IF NOT EXISTS dup_countries LIKE countries;

#4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
CREATE TABLE IF NOT EXISTS dup_countries AS SELECT * FROM countries;
INSERT DUP_COUNTRIES SELECT * FROM COUNTRIES;

#5. Write a SQL statement to create a table countries set a constraint NULL.
CREATE TABLE IF NOT EXISTS countries (
country_id int NOT NULL,
country_name varchar(40) NOT NULL,
region_id int NOT NULL,
CONSTRAINT pk_constraint PRIMARY KEY (country_id)
);

#6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE IF NOT EXISTS jobs (
job_id int NOT NULL,
job_title varchar(40) NOT NULL,
min_salary DEC(6,0),
max_salary DEC(6,0),
CHECK(max_salary <=25000)
);

#7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
CREATE TABLE countries (
country_id int,
country_name varchar(40),
region_id int,
CHECK(country_name = 'Italy' OR country_name = 'India' OR country_name = 'China'),
CONSTRAINT pk_countries PRIMARY KEY (country_id)
);
DESCRIBE countries;
#SAMPLE:
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2),
COUNTRY_NAME varchar(40)
CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
REGION_ID decimal(10,0)
);

#8. Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
create TABLE IF NOT EXISTS job_history (
employee_id DEC(6,0),
start_date date NOT NULL,
end_date date NOT NULL,
job_id int NOT NULL,
department_id DEC(4,0) NOT NULL,
CHECK (end_date LIKE '--/--/----'),
CONSTRAINT pk_job_history PRIMARY KEY (employee_id)
);
DESC job_history;

#9. Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
CREATE TABLE IF NOT EXISTS countries(
country_id varchar(2) UNIQUE,
country_name varchar(40),
region_id DEC(10,0)
#UNIQUE (country_name)
#OR CAN ALSO CREATE A PRIMARY KEY CONSTRAINT FOR THIS EXERCISE
);

#10. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE IF NOT EXISTS jobs (
job_id char(2) NOT NULL UNIQUE,
job_title varchar(40) NOT NULL DEFAULT ' ',
min_salary DEC(6,0) DEFAULT 8000,
max_salary DEC(6,0) DEFAULT NULL
);
DESC jobs;

#11. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.
CREATE TABLE countries (
country_id char(2),
country_name char(40) NOT NULL,
region_id int NOT NULL,
CONSTRAINT pk_countries PRIMARY KEY (country_id)
);
DESC countries;
#sample:
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);

#12. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value.
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID integer NOT NULL UNIQUE AUTO_INCREMENT,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL,
CONSTRAINT pk_countries PRIMARY KEY (COUNTRY_ID)
);
DESC countries;

13. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.
CREATE TABLE countries (
country_id char(4),
country_name varchar(40),
region_id DEC(4,0),
CONSTRAINT pk_countries PRIMARY KEY (country_id, region_id)
);
DESC countries;
#sample:
CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));
Copy

#14. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
CREATE TABLE IF NOT EXISTS job_history(
employee_id DEC(4,0) ,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
job_id varchar(10) NOT NULL,
department_id DEC(4,0) DEFAULT NULL,
CONSTRAINT pk_job_history PRIMARY KEY (employee_id),
CONSTRAINT fk_job_history FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

#15. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
CREATE TABLE IF NOT EXISTS employees (
employee_id int,
first_name varchar(20),
last_name varchar(30),
email varchar(100),
phone_number varchar(11),
hire_date DATE,
job_id varchar(10) NOT NULL,
salary DEC(6,0),
commission DEC(6,0),
manager_id int,
department_id int,
CONSTRAINT pk_employees PRIMARY KEY (employee_id),
CONSTRAINT fk_employees FOREIGN KEY (department_id, manager_id) REFERENCES 
departments(department_id, manager_id)
);

#16. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.
CREATE TABLE IF NOT EXISTS employees (
employee_id int,
first_name varchar(20),
last_name varchar(30),
email varchar(100),
phone_number varchar(11),
hire_date DATE,
job_id varchar(10) NOT NULL,
salary DEC(6,0) DEFAULT NULL,
commission_pct DEC(2,2) NOT NULL,
manager_id DEC(6,0) DEFAULT NULL,
department_id DEC(4,0) DEFAULT NULL,
CONSTRAINT pk_employees PRIMARY KEY (employee_id),
CONSTRAINT fk_employees1 FOREIGN KEY (department_id, manager_id) REFERENCES 
departments(department_id, manager_id),
CONSTRAINT fk_employees2_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
