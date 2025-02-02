WITH top_10_countries AS (
    SELECT
        job_country
    FROM job_postings_fact
    WHERE 
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist')
    GROUP BY job_country
    ORDER BY COUNT(*) DESC
    LIMIT 10
),
platform_post AS (
    SELECT
        job_via,
        COUNT(*) job_count
    FROM job_postings_fact
    WHERE
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        job_title_short IN ('Data Analyst', 'Data Engineer', 'Data Scientist') 
        AND job_country IN (SELECT job_country FROM top_10_countries)
    GROUP BY job_via
    HAVING (COUNT(*) / 12) > 150
    ORDER BY job_count DESC
)

SELECT *
FROM platform_post
WHERE job_count > (
    SELECT
        ROUND(AVG(job_count),0)
    FROM platform_post
)
LIMIT 5;
/*
Results =
[
  {
    "job_via": "via LinkedIn",
    "job_count": "97131"
  },
  {
    "job_via": "via BeBee",
    "job_count": "51574"
  },
  {
    "job_via": "via Indeed",
    "job_count": "24661"
  },
  {
    "job_via": "via Trabajo.org",
    "job_count": "19650"
  },
  {
    "job_via": "via Recruit.net",
    "job_count": "12359"
  }
]
*/