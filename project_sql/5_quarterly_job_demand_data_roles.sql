WITH monthly_demand AS (
    SELECT
        EXTRACT(MONTH FROM job_posted_date) AS month_post,
        COUNT(*) demand
    FROM job_postings_fact
    WHERE
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist')
    GROUP BY EXTRACT(MONTH FROM job_posted_date)
    ORDER BY demand DESC
)

SELECT
    CASE
        WHEN month_post IN ('1', '2', '3') THEN 'Q1'
        WHEN month_post IN ('4', '5', '6') THEN 'Q2'
        WHEN month_post IN ('7', '8', '9') THEN 'Q3'
        WHEN month_post IN ('10', '11', '12') THEN 'Q4'
    END AS quarter,
    SUM(demand) AS total_demand
FROM monthly_demand
GROUP BY quarter
ORDER BY total_demand DESC;
/*
Results =
[
  {
    "quarter": "Q1",
    "total_demand": "158466"
  },
  {
    "quarter": "Q3",
    "total_demand": "139518"
  },
  {
    "quarter": "Q4",
    "total_demand": "128842"
  },
  {
    "quarter": "Q2",
    "total_demand": "127860"
  }
]
*/