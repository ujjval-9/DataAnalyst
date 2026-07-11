/*SELECT job_title_short,
company_id,
job_location,
EXTRACT(MONTH FROM job_posted_date)
FROM january_jobs

UNION 

SELECT job_title_short,
company_id,
job_location,
EXTRACT(MONTH FROM job_posted_date)
FROM february_jobs  

*/

--ADVANCE PROBLEM---8
SELECT 
        first_quarter.job_title_short,
        first_quarter.job_location,
        first_quarter.job_via,
        first_quarter.job_posted_date::DATE,
        first_quarter.salary_year_avg
FROM(
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
) AS first_quarter
WHERE salary_year_avg > 70000  AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg  DESC;


