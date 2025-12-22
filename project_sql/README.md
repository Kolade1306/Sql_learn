# Insights Summary from Job Search Analysis from the Data Market.

The goal of this is to understand **which skills are most demanded** and **which roles offer the highest salaries** in the data job market.

---
# Tools I used 
- **SQL** The backbone of my analysis, allowing me to query the database and discover useful insights.
- **PostgreSQL** The chosen database management system, ideal for handling the job posting data.
- Git & Github: Essential for version control and sharing my SQL queries and analysis, ensuring collaboration and project tracking.

## Analysis

## 🔥 Most In-Demand Skills

Analysis query [top indemand-skills](/project_sql/3_top_demanded_skills.sql) shows that employers consistently demand a mix of **technical, analytical, and visualization skills**.
``` sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
  AND job_location = 'Anywhere' 
  AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY COUNT(skills_job_dim.job_id) DESC
LIMIT 5
```

### Key Observations:
- **SQL** is revealed to be the most demanded skill, appearing significantly more than any other.
- **Excel** remains highly relevant, highlighting its importance in real-world data work.
- **Python** is a core skill, especially for automation, analysis, and advanced analytics.
- **Tableau** and **R** indicate strong demand for data visualization and statistical analysis.
- The skill demand trend favors **data manipulation and analysis tools** over purely theoretical skills.

### Insight:
> Mastery of SQL, Excel, and Python provides a strong foundation for entry and mid-level data roles.

Link to query=> [top_demanded_skills](/project_sql/3_top_demanded_skills.sql)

---

## 💰 Top Paying Job Roles

From the dataset, salary analysis reveals that **senior and specialized roles command significantly higher pay**.

### Key Observations:
- The highest-paying roles exceed **$300,000 annually**.
- Roles such as **Director of Analytics** and **Associate Director – Data Insights** dominate the top salary range.
- Most top-paying jobs are:
  - **Full-time**
  - **Remote or location-flexible**
- Leading companies offering high salaries include **Meta, AT&T, Pinterest, and Mantys**.

### Insight:
> Higher compensation is strongly associated with leadership, strategic decision-making, and advanced analytics roles.

Link to query => [top_paying_jobs](/project_sql/1_top_paying_jobs.sql)

---

## 🔗 Skill Demand vs Salary Perspective

Combining insights from both datasets suggests:
- Highly demanded skills (SQL, Python) are essential but **do not alone guarantee the highest salaries**.
- Top-paying roles require **experience, leadership, and the ability to translate data into business strategy**.
- Visualization tools and communication skills become more critical at senior levels.

---

## 🎯 Career Takeaways
- Focus first on **core technical skills** (SQL, Python, Excel).
- Develop **visualization and storytelling skills** to stand out.
- Long-term salary growth depends on **experience, domain knowledge, and leadership ability**.
- Remote opportunities dominate high-paying data roles.

---

## 📌 Conclusion
The data job market rewards professionals who combine:
- Strong technical foundations  
- Analytical thinking  
- Business and leadership skills  

This makes continuous learning and project-based experience essential for career growth.
