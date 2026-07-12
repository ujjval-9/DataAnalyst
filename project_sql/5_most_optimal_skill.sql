/*
 MOST OPTIMAL SKILL
    High Demand
    Highly Paid(Greater Overall Avg Salary)
*/
WITH demanding_skill AS(
    SELECT
    skills_dim.skill_id, 
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS demand_count

FROM job_postings_fact

INNER JOIN
    skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND 
    job_work_from_home = True
GROUP BY
    skills_dim.skill_id


),

--WITH  ( while combining multiple CTEs we should we use comma(,) AS using with again and again shows error)
highly_paid_skill AS(
    SELECT
    skills_job_dim.skill_id, 
    
    ROUND(AVG(salary_year_avg),0) AS avg_salary  --IN ORDER TO USE GROUP BY FUNCTION WE HAVE USED AVG FUNCTION
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
    skills_job_dim.skill_id

)


--we can't combine table based on skills 
--we should combine it using primary keys i.e skill_id
-- we dont want to limit up until now and also dont care about order in the beginning
--grouping by skills is not best practice ,should group by skill_id

SELECT
    highly_paid_skill.skill_id,
    demanding_skill.skills,
    demand_count,
    avg_salary

FROM 
    highly_paid_skill
INNER JOIN --we only care about what exist in both tables
    demanding_skill ON 
    highly_paid_skill.skill_id = demanding_skill.skill_id
WHERE
    demand_count > 10
ORDER BY
    --demand_count DESC,-- We could use more than things 
                     --in order by clause for our purpose
    avg_salary DESC,
    demand_count DESC
LIMIT 25;