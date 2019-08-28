-- https://www.hackerrank.com/challenges/challenges/problem

select hacker_id, name, num_hack 
from (select hacker_id, name, num_hack, rank_hack, lag(rank_hack,1,0) over (order by num_hack desc) as rank_hack_lag 
    from (select a.hacker_id,a.name, count(b.challenge_id) as num_hack, rank() over (order by count(b.challenge_id) desc) as rank_hack 
            from hackers a 
            inner join challenges b on a.hacker_id = b.hacker_id
            group by a.hacker_id,a.name) as t) as t2 
            where rank_hack=1 or rank_hack not in 
                (select rank_hack
                 from (select a.hacker_id,a.name,count(b.challenge_id) as num_hack, rank() over 
                       (order by count(b.challenge_id) desc) as rank_hack 
                       from hackers a inner join challenges b on a.hacker_id = b.hacker_id 
                       group by a.hacker_id,a.name) as g 
                       group by rank_hack having count(hacker_id) > 1) 
                       order by num_hack desc,hacker_id asc