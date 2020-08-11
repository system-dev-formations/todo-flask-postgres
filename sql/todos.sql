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
    pub_date timestamp   default CURRENT_TIMESTAMP
);

alter table todos
    owner to postgres;

INSERT INTO todos ( title, text, done) VALUES ('test', 'test', 'false');
INSERT INTO todos ( title, text, done) VALUES ('flask', 'flask is the best', 'false');