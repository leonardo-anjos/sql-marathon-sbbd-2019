-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem

select round(avg(lat_n), 4) 
from station as s 
where ((select count(*) 
        from station 
        where lat_n < s.lat_n) - (select count(*) from station where lat_n > s.lat_n)) in (0,1,-1);