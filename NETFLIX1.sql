SELECT  release_year, director, count(*) as cn
FROM pop.data
where director is not null
group by release_year, director;

with cte as(
select director, release_year,count(show_id) over(partition by release_year   ) as rnk
from pop.data)
select *
from cte
order by rnk desc;

select director, release_year,count(*) as total
from pop.data
where director is not null
group by director,release_year;

with cte as(
select director, release_year, count(show_id) over(partition by  release_year) as rnk
from pop.data
where director is not null
 ), mm as(
 select  *, row_number() over(partition by release_year order by rnk desc) as nn
 from cte),cte5 as(
 select  director, release_year,max(nn) as sd
 from mm
 group by director, release_year
 ), loopa as(
 select *, max(sd) over(partition by release_year ) as n
 from cte5)
 select *
 from loopa
 where sd = n
 