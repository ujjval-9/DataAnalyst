/*--JANUARY
CREATE TABLE january_jobs AS 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

--FEBRUARY

CREATE TABLE february_jobs AS 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


--MARCH
CREATE TABLE march_jobs AS 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3; 
SELECT 
COUNT(job_id) as no_of_jobs,
CASE 
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title = 'Data Analyst'
GROUP BY location_category 
ORDER BY 
    no_of_jobs DESC;  */
