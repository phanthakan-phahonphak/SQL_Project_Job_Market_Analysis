SELECT
	ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank,
    job_title_short,
    COUNT(*)
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY job_title_short
ORDER BY COUNT(*) DESC
LIMIT 5;
/*
Results =
[
  {
    "rank": "1",
    "job_title_short": "Data Analyst",
    "count": "196108"
  },
  {
    "rank": "2",
    "job_title_short": "Data Engineer",
    "count": "186271"
  },
  {
    "rank": "3",
    "job_title_short": "Data Scientist",
    "count": "172307"
  },
  {
    "rank": "4",
    "job_title_short": "Business Analyst",
    "count": "49055"
  },
  {
    "rank": "5",
    "job_title_short": "Software Engineer",
    "count": "44906"
  }
]
*/