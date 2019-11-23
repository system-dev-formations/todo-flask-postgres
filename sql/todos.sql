-- Table: public.todos

-- DROP TABLE public.todos;

SET search_path to tododb;

create table public.todos
(
    todo_id  serial      not null
        constraint firstkey
            primary key,
    title    varchar(60) not null,
    text     varchar(80) not null,
    done     varchar(50) not null,
    pub_date date        not null
);

alter table public.todos
    owner to postgres;
