with comedies as(SELECT * 
FROM pop.data
where listed_in like "Comedies" and director is not null)
select  country, count(show_id) as total_movies
from comedies
group by country
limit 1;



select  listed_in, avg(duration) as avg_duration
from pop.data
where director is not null and type = "Movie"
group by listed_in;

with cte as(
select *,replace(duration, ' min', ' ' )   as duration1
from pop.data
where type = "Movie")
select listed_in, avg(duration) as du
from cte
group by listed_in;


select *, row_number() OVER(partition by  listed_in,DIRECTOR) AS RNK
from pop.data
WHERE LISTED_IN LIKE "HORROR MOVIES" OR LISTED_IN LIKE "COMEDIES" AND DIRECTOR IS NOT NULL;

with CTE AS(
SELECT  DIRECTOR, LISTED_IN,COUNT(*) AS TOTAL
FROM POP.DATA
WHERE DIRECTOR IS NOT NULL AND LISTED_IN LIKE "HORROR MOVIES" OR LISTED_IN LIKE "COMEDIES"
GROUP BY DIRECTOR,LISTED_IN
)
SELECT *
FROM CTE
WHERE DIRECTOR = "ADAM McKay";


 
