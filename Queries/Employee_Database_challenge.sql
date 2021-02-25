Select e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
Into retirement_titles
From employees as e
	Inner Join titles as ti
		On (e.emp_no = ti.emp_no)
Where (e.birth_date Between '1952-01-01' And '1955-12-31')
Order by e.emp_no;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

Select Count (ut.title), ut.title
Into retiring_titles
From unique_titles as ut
Group By ut.title
Order By Count DESC;

Select Distinct On (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
-- Into mentorship_eligibility
From employees as e
    Inner Join dept_emp as de
        On (e.emp_no = de.emp_no)
    Inner Join titles as ti
        On (de.emp_no = ti.emp_no)
Where (e.birth_date Between '1965-01-01' And '1965-12-31')
And (de.to_date = '9999-01-01')
Order By e.emp_no, ti.to_date DESC;

Select Count (me.title), me.title
Into mentorship_titles
From mentorship_eligibility as me
Group By me.title
Order By Count DESC;