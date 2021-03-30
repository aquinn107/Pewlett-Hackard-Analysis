-- Deliverable 1: Steps 1-7
SELECT em.emp_no,
    em.first_name,
em.last_name,
    t.title,
	t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as t
ON (em.emp_no = t.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;
-- retirement_count.csv exported
-- Deliverable 1: Steps 8-14
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
--unique_titles.csv exported
-- Deliverable 1: Steps 15-21
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

DROP TABLE retiring_titles;

SELECT * FROM retiring_titles;
--retiring_titles.csv exported

-- Deliverable 2:
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
    de.to_date,
	de.from_date,
    ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER By e.emp_no;
--mentorship_eligibility.csv exported