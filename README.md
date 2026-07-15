# Introduction
The Data Analyst profession has evolved significantly over the past few years. Organizations are increasingly seeking professionals who can work across the entire data lifecycle—from querying and transforming data to building dashboards and generating business insights.

This project analyzes skill requirements extracted from top Data Analyst job postings in 2023 to identify the most in-demand technologies, emerging trends, and evolving expectations within the analytics job market.

The goal is to understand which skills employers prioritize and provide data-driven insights for aspiring and current Data Analysts.

SQL Queries? Check out here : [project_sql folder](/project_sql/)




# Background
# Tools I used
**SQL :**

Used SQL to query, filter, aggregate, and analyze job posting data. It enabled efficient exploration of skill demand patterns and market trends.

**PostgreSQL :**

Used PostgreSQL as the relational database management system to store and manage the dataset. It provided a structured environment for performing analytical queries.

**Git :**

Used Git for version control to track project changes, maintain code history, and manage the analysis workflow efficiently.

**GitHub :**

Used GitHub to host the project repository, document findings, and showcase the analysis through a professional portfolio project.
# The Analysis
Each query for this project aimed at investigating specific job market.
Here's how I approached each question : 
### 1. Top Paying Data Analyst Jobs ###
Based on the dataset (10 highest-paying data analyst-related roles), the salaries show a strong concentration at the executive and senior specialist levels. The highest-paying position is Data Analyst with an average annual salary of $650,000, which is a significant outlier compared with the rest of the roles. The second-highest role, Director of Analytics, offers $336,500, nearly half of the top salary. Most of the remaining positions fall within the $184,000–$256,000 range, indicating that leadership, principal-level, and specialized analytics positions command substantially higher compensation. Overall, the data suggests that professionals who progress into director-level analytics roles or principal analyst positions can expect significantly higher earning potential than standard analyst positions.

```sql
SELECT 
    job_id,
    job_title,
    job_location,
    company.name,
    job_schedule_type,
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
LIMIT 10;
```
### Key Insights ###

Highest salary: Data Analyst — $650,000
Second highest: Director of Analytics — $336,500
Salary gap: The top role earns almost 93% more than the second-highest role.
Leadership premium: Director and Associate Director positions consistently appear among the highest-paying jobs.
Principal-level demand: Three Principal Data Analyst roles appear in the top 10, highlighting the value of advanced analytical expertise.
Typical top-tier range: Excluding the $650,000 outlier, most salaries cluster between $184K and $336K annually.

![Top Paying Job Roles](assets\top_10_highest_paying_job_roles.png)
*Bar Graph visualizing top 10 highest paying job roles*

### 2.Skills For Top Paying Jobs ###

### 3.In Demand Skills For Data Analysts ###
### 4.Skills Based On Salaries ###
### 5.Most Optimal Skill To Learn ###
# What I Learned
# Conclusion
