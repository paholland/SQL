-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--2
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(10)NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(50)  NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(2)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

-- CSV file is imported here

--4
DROP TABLE dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
	 emp_no INT NOT NULL
     );
-- CSV file is imported here

--5
DROP TABLE dept_emp;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL
);
-- CSV file is imported here

--3
DROP TABLE departments;

CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR NOT NULL,
	 CONSTRAINT pk_departments PRIMARY KEY (
        dept_no)
	);
	
-- CSV file is imported here
	
--1
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL,
    title VARCHAR(30) NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

--CSV file is imported here

--4
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL
);

-- CSV file is imported here

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dep_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dep_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dep_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);


