LOAD CSV
     FROM 'words.dat' (       id ,
                             word
     )
     INTO postgresql://postgres:password@51.68.5.241:6432/tododb?words (  id ,
                                                                          word
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists words; $$,
    $$ create table words (
             id         integer               not null,
             word       varchar(100)          not null,
             primary key (id)
       );
  $$;

