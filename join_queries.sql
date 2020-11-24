USE PersonalTrainer;

#Activity 1
#Select all columns from ExerciseCategory and Exercise.
#The tables should be joined on ExerciseCategoryId.
#This query returns all Exercises and their associated ExerciseCategory.
#64 rows
SELECT ExerciseCategory.ExerciseCategoryId, ExerciseCategory.Name, ExerciseCategory.ParentCategoryId, Exercise.ExerciseId,Exercise.Name, Exercise.ExerciseCategoryId
FROM ExerciseCategory
JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;
SELECT ExerciseCategory.ExerciseCategoryId, ExerciseCategory.Name, ExerciseCategory.ParentCategoryId, Exercise.ExerciseId,Exercise.Name
FROM ExerciseCategory
JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId

#Activity 2
#Select ExerciseCategory.Name and Exercise.Name where the ExerciseCategory does not have a ParentCategoryId (it is null).
#Again, join the tables on their shared key (ExerciseCategoryId).
#9 rows
SELECT ExerciseCategory.Name, Exercise.Name FROM ExerciseCategory JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId WHERE ExerciseCategory.ParentCategoryId IS NULL;

#Activity 3
#The query above is a little confusing. At first glance, it's hard to tell which Name belongs to ExerciseCategory and which belongs to Exercise.
#Rewrite the query using aliases:
#Alias ExerciseCategory.Name as 'CategoryName'.
#Alias Exercise.Name as 'ExerciseName'.
#9 rows
SELECT ExerciseCategory.Name AS CategoryName, Exercise.Name AS ExerciseName
FROM ExerciseCategory JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId
WHERE ExerciseCategory.ParentCategoryId IS NULL


#Activity 4
#Select FirstName, LastName, and BirthDate from Client and EmailAddress from Login where Client.BirthDate is in the 1990s.
#Join the tables by their key relationship.
#What is the primary-foreign key relationship?
#35 rows
SELECT FirstName, LastName, BirthDate
FROM Client
JOIN Login ON Client.ClientId = Login.ClientId WHERE Client.BirthDate BETWEEN '1990/01/01' AND '1990/12/31'


#Activity 5
#Select Workout.Name, Client.FirstName, and Client.LastName for Clients with LastNames starting with 'C'?
#How are Clients and Workouts related?
#25 rows
SELECT  Workout.Name, Client.FirstName, Client.LastName
FROM Workout
JOIN ClientWorkout ON Workout.WorkoutId = ClientWorkout.WorkoutId JOIN Client ON ClientWorkout.ClientId = Client.ClientId WHERE Client.LastName LIKE 'C%';


#Activity 6
#Select Names from Workouts and their Goals.
#This is a many-to-many relationship with a bridge table.
#Use aliases appropriately to avoid ambiguous columns in the result.
#78 rows
SELECT Workout.Name WorkoutName, Goal.Name GoalName
FROM Workout
JOIN WorkoutGoal ON Workout.WorkoutId = WorkoutGoal.WorkoutId JOIN Goal ON WorkoutGoal.GoalId = Goal.GoalId;


#Activity 7
#Does the Client, Romeo Seaward, have a Login?
#Decide using a single query.
#Depending on how this query is set up, it will return 1 row or 0 rows.
#NEED TO COMEBACK TO
SELECT EmailAddress
FROM Login
INNER JOIN Client ON Login.ClientId = Client.ClientId WHERE Client.FirstName='Romeo' AND Client.LastName='Seaward';#NOT SURE IF CORRECT


#Activity 8
#Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
#This requires a self-join.
#12 rows
SELECT parent.Name ParentName, child.Name ChildName
FROM ExerciseCategory parent
JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ParentCategoryId;

#Activity 10
#Rewrite the query above so that every ExerciseCategory.Name is included, even if it doesn't have a parent.
16 rows
SELECT parent.Name ParentName, child.Name ChildName FROM ExerciseCategory parent RIGHT JOIN ExerciseCategory child ON parent.ExerciseCategoryId = child.ExerciseCategoryId;
SELECT parent.Name ParentName, child.Name ChildName FROM ExerciseCategory child LEFT JOIN ExerciseCategory parent ON child.ParentCategoryId = parent.ExerciseCategoryId;


#Activity 11
#Are there Clients who are not signed up for a Workout?
#50 rows
SELECT Client.ClientId
FROM Client
LEFT JOIN ClientWorkout ON Client.ClientId = ClientWorkout.ClientId WHERE ClientWorkout.WorkoutId IS null;


#Activity 12
#Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
#Goals are associated to Clients through ClientGoal.
#Goals are associated to Workouts through WorkoutGoal.
#6 rows, 4 unique rows
SELECT Workout.Name, Goal.Name
FROM Client JOIN ClientGoal ON Client.ClientId = Client.ClientId
JOIN Goal ON ClientGoal.GoalId = Goal.GoalId JOIN WorkoutGoal ON Goal.GoalId = WorkoutGoal.GoalId JOIN Workout ON WorkoutGoal.WorkoutId = Workout.WorkoutId WHERE Client.FirstName = 'Shell' AND Client.LastName = 'Creane';

#-----------------------------------------------------------------EXERCISES FROM: https://www.w3resource.com/mysql-exercises/join-exercises/-------------------------------------------

#1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT departments.LOCATION_ID, locations.STREET_ADDRESS, locations.CITY, locations.STATE_PROVINCE,
countries.COUNTRY_NAME
From departments
JOIN locations ON departments.LOCATION_ID = locations.LOCATION_ID
JOIN countries ON locations.COUNTRY_ID = countries.COUNTRY_ID;

#2. Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT employees.FIRST_NAME, employees.LAST_NAME, departments.DEPARTMENT_ID,
departments.DEPARTMENT_NAME
FROM employees
JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;

#3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
SELECT employees.first_name, employees.last_name, jobs.job_title, departments.department_id,
departments.department_name, locations.city
FROM employees JOIN jobs ON employees.job_id = jobs.job_id
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id
WHERE locations.city = 'London';
#Sample answer:
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l ON
(d.location_id = l.location_id)
WHERE LOWER(l.city) = 'London';

#4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name). //SELF JOIN
SELECT e.employee_id, e.last_name, m.employee_id, m.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;#THIS MEANS WHTEVER MANAGER ID THIS EMPLOYEE HAS I WANT TO JOIN IT TO THE M.EMPLOYEE ID SO I CAN GET THE EMPLOYEE ID OF THIS MANAGER AND LAST NAME

#5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones
select first_name,last_name,hire_date
FROM employees
WHERE hire_date>(select hire_date from employees where last_name='Jones');#USING SUBQUERY
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees davies  ON (davies.last_name = 'Jones') WHERE davies.hire_date < e.hire_date;#Need to go over

#6. Write a query to get the department name and number of employees in the department.
#SELECT departments.department_name, COUNT(employees.employee_id)
FROM departments
JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_name;
SELECT department_name AS 'Department Name', COUNT(*) AS 'No of Employees'
FROM departments
INNER JOIN employees ON employees.department_id = departments.department_id
GROUP BY departments.department_id, department_name ORDER BY department_name;#SAMPLE ANSWER

#7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.#need to read question again
SELECT employees.employee_id, jobs.job_title, (job_history.end_date - job_history.start_date)
number_of_days
FROM employees JOIN job_history ON employees.employee_id = job_history.employee_id
JOIN jobs ON employees.job_id = jobs.job_id
WHERE job_history.department_id = 90;
#OR
SELECT employees.employee_id, jobs.job_title, (job_history.end_date
- job_history.start_date) AS number_of_days
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id JOIN job_history ON jobs.job_id = job_history.job_id
JOIN departments ON job_history.department_id = departments.department_id
WHERE departments.department_id = 90;
#SAMPLE
SELECT employee_id, job_title, end_date-start_date Days FROM job_history
NATURAL JOIN jobs
WHERE department_id=90;

#8. Write a query to display the department ID and name and first name of manager.
SELECT departments.department_id, departments.department_name, employees.first_name
FROM departments
JOIN employees ON departments.manager_id = employees.employee_id;

#9. Write a query to display the department name, manager name, and city
SELECT departments.department_name, employees.first_name, locations.city
FROM departments
JOIN employees ON departments.manager_id = employees.employee_id
JOIN locations ON departments.location_id = locations.location_id;

#11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT jobs.job_title, employees.first_name, (employees.salary - jobs.min_salary) AS difference_of_salary_against_min_salary
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id;
SELECT jobs.job_title, employees.first_name, (employees.salary - jobs.min_salary) AS difference_of_salary_against_min_salary
FROM employees
JOIN jobs ON jobs.job_id = employees.job_id;# SAME RESULT
#sample answer:
SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary'
FROM employees
NATURAL JOIN jobs;

#12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT job_history.employee_id, job_history.start_date, job_history.end_date, job_history.job_id, job_history.department_id
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id
WHERE employees.salary > 10000;


#13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT departments.department_name, employees.first_name, employees.last_name, employees.hire_date, employees.salary
FROM departments
JOIN employees ON departments.manager_id = employees.employee_id
WHERE (curdate() - employees.hire_date > 5745);
#NEED TO LOOK AT THE BELOW QUERY, IT'S IS A GOOD EXAMPLE OF SAMPLE ANSWER FOR 13
SELECT first_name, last_name, hire_date, salary,
(DATEDIFF(now(), hire_date))/365 Experience
FROM departments d JOIN employees e
ON (d.manager_id = e.employee_id)
WHERE (DATEDIFF(now(), hire_date))/365>15;
