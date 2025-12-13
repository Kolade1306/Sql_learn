SELECT 
    job_title_short AS title,
    job_location AS location,
    -- Converting job_posted_date to date --
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM 
    job_postings_fact
LIMIT 10;

SELECT 
    job_title_short AS title,
    job_location AS location,
    -- Converting job_posted_date to date --
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
    job_postings_fact
LIMIT 10;

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;

SELECT
    AVG(salary_year_avg) AS yearly,
    AVG(salary_hour_avg) AS hourly,
    job_schedule_type
FROM
    job_postings_fact
WHERE
    DATE(job_posted_date) = '2023-06-01'
GROUP BY
    job_schedule_type

SELECT
    DATE(job_posted_date) AS post_date
FROM
    job_postings_fact
LIMIT 5;

-- CASE EXPRESSIONS --
SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END
FROM
    job_postings_fact

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category