use pandemic;

DELIMITER //
create function if not exists GetDate(year year)
    returns date
    deterministic
    no sql
    begin
        return date(CONCAT(year, '-', 1, '-', 1));
    end //
DELIMITER ;

select e.name                               as entity,
       c.year                               as original_year,
       GetDate(c.year)                      as into_date,
       curdate()                            as cur_date,
       datediff(curdate(), GetDate(c.year)) as diff_in_days
from cases as c
         inner join pandemic.entity e on e.id = c.entity_id