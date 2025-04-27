SELECT  director, country, count(*) as freq
FROM pop.data
where director is not null and country is not null
group by director, country
order by count(*) desc;


create temporary table direct as
select director, country
from(
		 select director, country,row_number() over(partition by director order by count(*) desc) as rnk
         from data
         where country is not null and director is not null
         group by director, country) t
         where rnk = 1;
         
         
         update data y
         join direct dc on y.director = dc.director
         set y.country = dc.country
         where y.country is null;
         
         select  type, count(show_id) as total
         from data
         group by type;
         
         select   country , count(show_id) as total
         from data
         where country is not null
         group by country;
          