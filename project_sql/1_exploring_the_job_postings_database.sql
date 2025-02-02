SELECT
	EXTRACT(YEAR FROM job_posted_date) AS posting_year,
	COUNT(*)
FROM job_postings_fact
GROUP BY EXTRACT(YEAR FROM job_posted_date)
/*
Results =
[
  {
    "posting_year": "2023",
    "count": "785791"
  },
  {
    "posting_year": "2022",
    "count": "1895"
  }
]*/