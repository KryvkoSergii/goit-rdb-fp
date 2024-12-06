select e.name                                                    as entity,
       c.year                                                    as original_year,
       date(CONCAT(c.year, '-', 1, '-', 1))                      as into_date,
       curdate()                                                 as cur_date,
       datediff(curdate(), date(CONCAT(c.year, '-', 1, '-', 1))) as diff_in_days
from cases as c
         inner join pandemic.entity e on e.id = c.entity_id