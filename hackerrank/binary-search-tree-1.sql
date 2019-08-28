-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem

select n, if(p is null, 'Root', if((select count(*) from bst where p = b.n) > 0, 'Inner', 'Leaf'))
from bst as b 
order by n asc