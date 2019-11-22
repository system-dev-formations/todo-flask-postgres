-- Table: public.todos

-- DROP TABLE public.todos;

create table todos
(
    todo_id  serial      not null
        constraint firstkey
            primary key,
    title    varchar(60) not null,
    text     varchar(80) not null,
    done     varchar(50) not null,
    pub_date date        not null
);

alter table todos
    owner to postgres;

INSERT INTO public.todos (todo_id, title, text, done, pub_date) VALUES (1, 'CrunchyDevops', 'test', 'false', '2019-11-22');