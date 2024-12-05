# Міграція даних з infectious_cases до entity. В таблиці тільки унікалі name(Entity)
insert into entity(name, code)
select distinct(ic.Entity) as name, ic.Code as code from infectious_cases as ic;

# Міграція даних з infectious_cases до cases.
insert into cases(year, entity_id, number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases)
SELECT year, (select id from entity where name=entity), number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases
from infectious_cases;

# Перевірка унікальності в entity
(select distinct (e.name), count(e.id) from entity as e
group by e.name
having count(e.id) > 1
order by count(e.id) desc)
union
(select 'total records', count(*) from entity);

# кількість записів в cases
(select 'total records', count(*) from cases)