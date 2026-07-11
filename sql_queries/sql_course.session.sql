/*SELECT job_posted_date
FROM job_postings_fact
LIMIT 10; 
SELECT '2023-02-19' :: DATE,
    '123' :: INTEGER,
    'true' :: BOOLEAN; 
SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date :: DATE AS date
FROM job_postings_fact
LIMIT 100;    

SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date as utc_time_date,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'  AS date_time
FROM job_postings_fact
LIMIT 5;   
SELECT 
job_title_short AS title,
job_location AS location,
job_posted_date as date_time,
EXTRACT(MONTH FROM job_posted_date) AS job_posted_month ,
EXTRACT(YEAR FROM job_posted_date) AS job_posted_year
FROM job_postings_fact
LIMIT 5
GROUP BY job_posted_month; */


SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS applicants
    
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    month 
ORDER BY 
    applicants DESC;