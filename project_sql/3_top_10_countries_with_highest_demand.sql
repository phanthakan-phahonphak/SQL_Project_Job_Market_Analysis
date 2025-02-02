SELECT
    job_country,
    COUNT(*) job_demand
FROM job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023 AND
    job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist')
GROUP BY job_country
ORDER BY job_demand DESC
LIMIT 10;
/*
Results =
[
  {
    "job_country": "United States",
    "job_demand": "161829"
  },
  {
    "job_country": "India",
    "job_demand": "38447"
  },
  {
    "job_country": "France",
    "job_demand": "34254"
  },
  {
    "job_country": "United Kingdom",
    "job_demand": "31454"
  },
  {
    "job_country": "Germany",
    "job_demand": "20562"
  },
  {
    "job_country": "Spain",
    "job_demand": "17529"
  },
  {
    "job_country": "Sudan",
    "job_demand": "16415"
  },
  {
    "job_country": "Singapore",
    "job_demand": "16131"
  },
  {
    "job_country": "Netherlands",
    "job_demand": "14859"
  },
  {
    "job_country": "Italy",
    "job_demand": "12527"
  }
]
*/