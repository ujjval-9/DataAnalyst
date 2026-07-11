--SUB   QUERIES

/*SELECT * 
FROM ( --subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)AS january_jobs
LIMIT 10;  
--sub query ends here

--CTE

WITH january_jobs AS(--CTE defination start here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) --CTE defination ends here  

SELECT *
FROM january_jobs ;  

--OPERATION USING SUB QUERIES
SELECT
    company_id,
    name AS company_name 
FROM  company_dim
WHERE company_id IN ( 
    SELECT company_id
            
    FROM job_postings_fact
    WHERE 
        job_no_degree_mention = TRUE
    ORDER BY
        company_id
)  

WITH company_job_counts AS(
SELECT company_id,
        COUNT(*) AS total_jobs

FROM 
    job_postings_fact
GROUP BY company_id
)

SELECT company_dim.name,
        company_job_counts.total_jobs
    
FROM company_dim
LEFT JOIN company_job_counts ON company_job_counts.company_id = company_dim.company_id

ORDER BY total_jobs DESC;  */

WITH remote_job_skills AS(
        SELECT --job_postings_fact.job_id,
        skill_id,
        COUNT(*) AS skill_count
        FROM skills_job_dim AS skills_to_job
        INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_to_job.job_id
        WHERE job_postings_fact.job_work_from_home = TRUE AND job_title_short = 'Data Analyst'
        GROUP BY  skill_id
)

SELECT  
    skills_dim.skill_id,
    remote_job_skills.skill_count,
    skills
FROM remote_job_skills
INNER JOIN skills_dim ON skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5 ; 