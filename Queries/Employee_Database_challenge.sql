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