WITH top_paying_jobs AS(
        SELECT 
            job_id,
            job_title,
            company.name,
            salary_year_avg,
            job_posted_date
        FROM    
          job_postings_fact
        LEFT JOIN 
          company_dim AS company ON
            job_postings_fact.company_id = company.company_id
        WHERE 
         job_title_short = 'Data Analyst' AND 
         job_location = 'Anywhere' AND 
         salary_year_avg IS NOT NULL
        ORDER BY
            salary_year_avg DESC
        LIMIT 10
)


SELECT 
    top_paying_jobs.job_id,
    skills_job_dim.skill_id,-- top_paying_jobs.* could complete this task..
    type,
    skills,
    job_title,
    name,
    salary_year_avg
FROM top_paying_jobs
INNER JOIN
    skills_job_dim ON
    top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

/*


[
  {
    "job_id": 552322,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 5,
    "type": "programming",
    "skills": "r",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 74,
    "type": "cloud",
    "skills": "azure",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 75,
    "type": "cloud",
    "skills": "databricks",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 76,
    "type": "cloud",
    "skills": "aws",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 93,
    "type": "libraries",
    "skills": "pandas",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 95,
    "type": "libraries",
    "skills": "pyspark",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 102,
    "type": "libraries",
    "skills": "jupyter",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 181,
    "type": "analyst_tools",
    "skills": "excel",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 182,
    "type": "analyst_tools",
    "skills": "tableau",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 183,
    "type": "analyst_tools",
    "skills": "power bi",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 552322,
    "skill_id": 196,
    "type": "analyst_tools",
    "skills": "powerpoint",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 99305,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 99305,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 99305,
    "skill_id": 5,
    "type": "programming",
    "skills": "r",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 99305,
    "skill_id": 97,
    "type": "libraries",
    "skills": "hadoop",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 99305,
    "skill_id": 182,
    "type": "analyst_tools",
    "skills": "tableau",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 1021647,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 1021647,
    "skill_id": 23,
    "type": "programming",
    "skills": "crystal",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 1021647,
    "skill_id": 79,
    "type": "cloud",
    "skills": "oracle",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 1021647,
    "skill_id": 182,
    "type": "analyst_tools",
    "skills": "tableau",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 1021647,
    "skill_id": 215,
    "type": "other",
    "skills": "flow",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 8,
    "type": "programming",
    "skills": "go",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 80,
    "type": "cloud",
    "skills": "snowflake",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 93,
    "type": "libraries",
    "skills": "pandas",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 94,
    "type": "libraries",
    "skills": "numpy",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 181,
    "type": "analyst_tools",
    "skills": "excel",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 182,
    "type": "analyst_tools",
    "skills": "tableau",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 168310,
    "skill_id": 220,
    "type": "other",
    "skills": "gitlab",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 731368,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 74,
    "type": "cloud",
    "skills": "azure",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 76,
    "type": "cloud",
    "skills": "aws",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 79,
    "type": "cloud",
    "skills": "oracle",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 80,
    "type": "cloud",
    "skills": "snowflake",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 182,
    "type": "analyst_tools",
    "skills": "tableau",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 183,
    "type": "analyst_tools",
    "skills": "power bi",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 189,
    "type": "analyst_tools",
    "skills": "sap",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 211,
    "type": "other",
    "skills": "jenkins",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 218,
    "type": "other",
    "skills": "bitbucket",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 219,
    "type": "other",
    "skills": "atlassian",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 233,
    "type": "async",
    "skills": "jira",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 731368,
    "skill_id": 234,
    "type": "async",
    "skills": "confluence",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 310660,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 5,
    "type": "programming",
    "skills": "r",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 210,
    "type": "other",
    "skills": "git",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 218,
    "type": "other",
    "skills": "bitbucket",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 219,
    "type": "other",
    "skills": "atlassian",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 233,
    "type": "async",
    "skills": "jira",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 310660,
    "skill_id": 234,
    "type": "async",
    "skills": "confluence",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 8,
    "type": "programming",
    "skills": "go",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 80,
    "type": "cloud",
    "skills": "snowflake",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 93,
    "type": "libraries",
    "skills": "pandas",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 94,
    "type": "libraries",
    "skills": "numpy",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 181,
    "type": "analyst_tools",
    "skills": "excel",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 182,
    "type": "analyst_tools",
    "skills": "tableau",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 1749593,
    "skill_id": 220,
    "type": "other",
    "skills": "gitlab",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 387860,
    "skill_id": 0,
    "type": "programming",
    "skills": "sql",
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0"
  },
  {
    "job_id": 387860,
    "skill_id": 1,
    "type": "programming",
    "skills": "python",
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0"
  },
  {
    "job_id": 387860,
    "skill_id": 5,
    "type": "programming",
    "skills": "r",
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0"
  }
]

*/