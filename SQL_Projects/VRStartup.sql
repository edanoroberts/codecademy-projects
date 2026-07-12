/*
1.
Start by familiarizing yourself with the tables. Examine the data from the employees table.

SELECT * FROM employees;


Examine the data in the projects table.

Do you think there’s a way to join the two tables?

SELECT * FROM projects;
-- project_id on projects links to current_project on employees

3.
What are the names of employees who have not chosen a project?

SELECT first_name, last_name
FROM employees
WHERE current_project IS NULL;

4.
What are the names of projects that were not chosen by any employees?

SELECT project_name
FROM projects
WHERE project_id NOT IN(
  SELECT current_project
  FROM employees
  WHERE current_projects IS NOT NULL);
-- all projects are being worked on

5.
What is the name of the project chosen by the most employees?

SELECT projects.project_name AS 'project_name',
  COUNT(*)
FROM employees
INNER JOIN projects
  ON projects.project_id = employees.current_project
WHERE current_project IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
--FistsOfFury

6.
Which projects were chosen by multiple employees?

SELECT projects.project_name AS 'project_name',
  COUNT(*)
FROM employees
INNER JOIN projects
  ON projects.project_id = employees.current_project
GROUP BY project_name
HAVING COUNT(*) > 1;

7.
Which personality is the most common across our employees?

SELECT personality
FROM employees
GROUP BY personality
ORDER BY COUNT(personality) DESC
LIMIT 1;
-- ENFJ

8.
What are the names of projects chosen by employees with the most common personality type?

SELECT projects.project_name AS 'project_name',
  employees.personality AS 'personality'
FROM employees
INNER JOIN projects
  ON projects.project_id = employees.current_project
WHERE personality = 'ENFJ'
GROUP BY project_name;

9.
Find the personality type most represented by employees with a selected project.

What are names of those employees, the personality type, and the names of the project they’ve chosen?
*/
SELECT last_name, first_name, personality, project_name
FROM employees
INNER JOIN projects 
  ON employees.current_project = projects.project_id
WHERE personality = (
   SELECT personality 
   FROM employees
   WHERE current_project IS NOT NULL
   GROUP BY personality
   ORDER BY COUNT(personality) DESC
   LIMIT 1);
