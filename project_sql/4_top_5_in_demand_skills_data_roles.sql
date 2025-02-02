WITH skills_per_role AS (
    SELECT
        skills_dim.skills,
        COUNT(*) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist')
    GROUP BY skills_dim.skills
    ORDER BY demand_count DESC
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY SUM(demand_count) DESC) AS rank,
    skills, 
    SUM(demand_count) AS total_demand_count    
FROM skills_per_role
GROUP BY skills
ORDER BY ROW_NUMBER() OVER (ORDER BY SUM(demand_count) DESC)
LIMIT 5;
/*
Results =
[
  {
    "rank": "1",
    "skills": "sql",
    "total_demand_count": "284573"
  },
  {
    "rank": "2",
    "skills": "python",
    "total_demand_count": "278970"
  },
  {
    "rank": "3",
    "skills": "r",
    "total_demand_count": "102254"
  },
  {
    "rank": "4",
    "skills": "aws",
    "total_demand_count": "97343"
  },
  {
    "rank": "5",
    "skills": "tableau",
    "total_demand_count": "94673"
  }
]
 */