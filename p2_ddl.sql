create table if not exists pandemic.entity
(
    id   int auto_increment
        primary key,
    code varchar(3)   null,
    name varchar(255) not null,
    constraint name_UNIQUE
        unique (name)
);

create table if not exists pandemic.cases
(
    id                   int auto_increment
        primary key,
    year                 year   null,
    entity_id            int    null,
    number_yaws          double null,
    polio_cases          bigint null,
    cases_guinea_worm    bigint null,
    number_rabies        double null,
    number_malaria       double null,
    number_hiv           double null,
    number_tuberculosis  double null,
    number_smallpox      double null,
    number_cholera_cases bigint null,
    constraint entity_id_fk
        foreign key (entity_id) references pandemic.entity (id)
);

create index entity_id_fk_idx
    on pandemic.cases (entity_id);