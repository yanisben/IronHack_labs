use employees_mod;

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT avg(salary) FROM t_salaries;
END$$

call avg_salary();

-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their 
-- employee number.

drop procedure emp_info();

DELIMITER $$
CREATE PROCEDURE emp_info(in fname text, in lname text)
BEGIN
SELECT emp_no FROM t_employees
WHERE fname = first_name and lname = last_name;
END$$

call emp_info("Saniya", "Kalloufi")

-- Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee. 
-- Hint: In the BEGIN-END block of this program, you need to declare and use two variables –

DELIMITER $$ 
CREATE FUNCTION emp_no(fname text, lname text) 
RETURNS decimal
DETERMINISTIC
BEGIN
	DECLARE salary_emp int;
    DECLARE max_date date;
		select max(s.from_date) into max_date
		from t_salaries s
		join t_employees e
		on s.emp_no = e.emp_no
		where lname = e.last_name and fname = e.first_name;
        select s.salary into salary_emp
        from t_salaries s
		join t_employees e
		on s.emp_no = e.emp_no
        where s.from_date = max_date and lname = e.last_name and fname = e.first_name;
RETURN salary_emp;
END$$ 
DELIMITER ; 

SELECT emp_no("Saniya", "Kalloufi");


-- Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be 
-- the current date. Format the output appropriately (YY-MM-DD)

DELIMITER $$
CREATE TRIGGER employee_insert
BEFORE INSERT ON t_employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date > sysdate() THEN 
		SET NEW.hire_date = sysdate(); 
	END IF; 
END $$

-- Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.

-- CREATE INDEX i_hire_date ON t_employees(hire_date);
DROP INDEX i_hire_date ON t_employees;
END$$

-- Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum. 
-- Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

SELECT *
FROM t_salaries s
WHERE s.salary > 89000; -- Yes, query is faster with an index

-- CREATE INDEX i_salary ON t_salaries(salary);


-- Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees with a 
-- number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, according to 
-- the data provided in the dept_manager table, or a regular employee.

SELECT e.emp_no, e.first_name, e.last_name,
CASE WHEN e.emp_no in (select emp_no from t_dept_manager)-- m.emp_no
THEN "Manager"
ELSE "Nope"
END AS Manager
FROM t_employees e 
LEFT JOIN t_dept_manager m 
ON e.emp_no = m.emp_no
WHERE e.emp_no > 109990;

-- Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns 
-- at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this 
-- salary raise was higher than $30,000 or NOT.

SELECT m.emp_no, e.first_name, e.last_name, (max(salary) - min(s.salary)),
CASE
	WHEN (max(s.salary) - min(s.salary)) > 30000
    THEN "Big raise"
    ELSE "Small raise"
END AS Raise
FROM t_salaries s
JOIN t_dept_manager m 
ON s.emp_no = m.emp_no
JOIN t_employees e
ON m.emp_no = e.emp_no
GROUP BY s.emp_no

-- Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” 
-- saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t. Hint: You’ll 
-- need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

SELECT e.emp_no, e.first_name, e.last_name, 
CASE 
	WHEN max(to_date) like '9999%'
    THEN "Is still employed"
	ELSE "Not an employee anymore"
END AS "current_employee"
FROM t_dept_emp d
JOIN t_employees e
ON d.emp_no = e.emp_no
GROUP BY d.emp_no
ORDER BY d.emp_no ASC