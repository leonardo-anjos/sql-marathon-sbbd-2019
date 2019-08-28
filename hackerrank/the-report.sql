-- https://www.hackerrank.com/challenges/the-report/problem

select (case g.grade >= 8 when true then s.name else null end), g.grade, s.marks
from students s 
inner join grades g on s.marks between min_mark and max_mark
order by g.grade desc, s.name, s.marks