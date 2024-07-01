-- 1. Find the total number of employees in the dataset.
		SELECT COUNT(*) AS TOTAL_EMP
        FROM jobs_in_data;
-- 2. List all unique job titles.
		SELECT distinct job_title FROM jobs_in_data;
-- 3. Find the average salary for each job category.
		SELECT job_category, AVG(SALARY) AS AVG_SALARY
        FROM jobs_in_data
        group by job_category;
-- 4. Find the maximum salary in each company location.
		select company_location, MAX(SALARY) AS MAX_SALARY
        FROM jobs_in_data
        group by company_location
        ORDER BY MAX(SALARY) DESC;
-- 5. Count the number of employees with different employment types.
		SELECT employment_type , COUNT(employment_type) AS "employment types."
        FROM jobs_in_data
        group by employment_type;
-- 6. Calculate the average salary for employees working remotely.
		SELECT AVG(SALARY) AS AVG_SALARY
        FROM jobs_in_data
        WHERE work_setting = 'Remote';
-- 7. Find the number of employees in each job category.
		SELECT job_category , COUNT(job_category) AS "NUMBER OF EMPLOYEES"
        FROM jobs_in_data
        group by job_category;
-- 8. Find the job title with the highest salary in each company location.
		SELECT job_title, company_location ,max(SALARY) AS "highest salary"
        FROM jobs_in_data
        group by job_title, company_location ;
-- 9. List the top 5 job titles with the highest average salary.
		SELECT job_title , AVG(SALARY) AS "highest average salary"
        FROM jobs_in_data
        group by job_title
        ORDER BY AVG(salary) DESC
        LIMIT 5;
-- 10. Find the employee with the highest salary in each country.
		SELECT employee_residence, company_location, MAX(SALARY) AS "highest salary in each country"
        FROM jobs_in_data
        group BY company_location,employee_residence;
-- 11. Calculate the total salary paid for each job category.
		SELECT job_category , SUM(SALARY) AS "total salary paid "
        FROM jobs_in_data
        group by job_category;
-- 12. Find the most common employment type for each job title.
		SELECT job_title, employment_type, COUNT(*) AS COUNT FROM jobs_in_data
        group by job_title,employment_type
        order by job_title, employment_type DESC;
-- 13. Calculate the average salary for employees with a senior experience level in each country.
		SELECT experience_level, company_location ,AVG(SALARY) AS AVG_SALARYT
        FROM jobs_in_data
        WHERE experience_level = 'Senior'
        group by company_location;
-- 14. Find the average salary for each combination of job title and employment type.
		SELECT job_title, employment_type, AVG(salary_in_usd) AS avg_salary
			FROM jobs_in_data
				GROUP BY job_title, employment_type;
-- 15. Calculate the number of employees in each experience level for each country.
		SELECT company_location, experience_level , COUNT(*) AS EMP_COUNT
        FROM jobs_in_data 
        group by experience_level ,company_location
        ORDER BY company_location ;
-- 16. Find the average salary for each job category in each company location.
		SELECT job_category , company_location , AVG(SALARY) AS AVG_SALARY
        FROM jobs_in_data
        group by  company_location, job_category;
-- 17. List the job titles with a salary above a certain threshold (e.g., 200000 USD).	
		SELECT job_title , SALARY
        FROM jobs_in_data
        WHERE SALARY > 200000;
-- 18. Calculate the difference in average salary between full-time and part-time employees for each job title.
		SELECT job_title, 
        AVG(CASE WHEN employment_type = 'Full-time' THEN salary ELSE NULL END) - 
       AVG(CASE WHEN employment_type = 'Part-time' THEN salary ELSE NULL END) AS avg_salary_diff
        FROM jobs_in_data
        GROUP BY job_title;
-- 19. Find the number of employees with more than 5 years of experience in each job title
        SELECT job_title, COUNT(*) AS count
        FROM jobs_in_data
           WHERE experience_level = 'Senior'
          GROUP BY job_title;
-- 20. Calculate the average salary for each job title in each year.
		SELECT WORK_YEAR , job_title , AVG(SALARY) AS AVG_SALARY
        FROM jobs_in_data
        group by work_year, job_title
        ORDER BY work_year;