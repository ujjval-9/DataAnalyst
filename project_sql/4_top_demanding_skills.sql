SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary  --IN ORDER TO USE GROUP BY FUNCTION WE HAVE USED AVG FUNCTION
--NEW LEARNING :ROUND FUNCTION
FROM job_postings_fact

INNER JOIN
    skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
    --demand_count IS NOT NULL
GROUP BY
    skills
ORDER BY 
    avg_salary  DESC
LIMIT 25