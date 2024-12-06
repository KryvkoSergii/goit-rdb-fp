select e.name             as entity,
       avg(number_rabies) as average,
       min(number_rabies) as min,
       max(number_rabies) as max,
       sum(number_rabies) as sum
from cases as c
         inner join pandemic.entity e on e.id = c.entity_id
group by e.name
order by avg(number_rabies) desc
limit 10