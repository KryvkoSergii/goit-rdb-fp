create table if not exists pandemic.infectious_cases
(
    Entity               varchar(255) not null,
    Code                 varchar(3)   null,
    Year                 year         null,
    Number_yaws          double       null,
    polio_cases          bigint       null,
    cases_guinea_worm    bigint       null,
    Number_rabies        double       null,
    Number_malaria       double       null,
    Number_hiv           double       null,
    Number_tuberculosis  double       null,
    Number_smallpox      double       null,
    Number_cholera_cases bigint       null
);