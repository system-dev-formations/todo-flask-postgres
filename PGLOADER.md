# pgloader

## install
```shell
sudo apt-get install sbcl unzip libsqlite3-dev make curl gawk freetds-dev libzip-dev
cd 
git clone https://github.com/dimitri/pgloader.git
cd pgloader
make pgloader
./build/bin/pgloader -V
sudo cp build/bin/pgloader /usr/bin/
pgloader -V
```

## Load data
Type
```shell
cd   
git clone https://github.com/dwyl/english-words.git
```   
copy words.txt to your project  
create a python program named convert_words.py to convert this file to a file words.dat containing this format: line number | word |  
Example  
4 | 10-point |  
5 | 10th |  
run convert_words.py
Analyze the file words.ctl    
Run ``` pgloader words.ctl```
Check the result using jetbrains database feature  

## Generate series
### get number of rows
```sql92
SELECT count(*) AS ct              -- optional
, min(id)  AS min_id
, max(id)  AS max_id
, max(id) - min(id) AS id_span
FROM  words;
```
## Better way
```sql92
SELECT reltuples AS ct FROM pg_class
WHERE oid = 'public.words'::regclass;
-- solution 
WITH params AS (
SELECT 1       AS min_id           -- minimum id <= current min id
, 5100000 AS id_span          -- rounded up. (max_id - min_id + buffer)
)
SELECT word
FROM  (
SELECT p.min_id + trunc(random() * p.id_span)::integer AS id
FROM   params p
,generate_series(1, 1100) g  -- 1000 + buffer
GROUP  BY 1                        -- trim duplicates
) r
JOIN   words USING (id)
LIMIT  1000;
```
# Load test samples to todos table  
```sql92
INSERT INTO todos ( title, text)(
    WITH params AS (
        SELECT 1      AS min_id -- minimum id <= current min id
             , 500000 AS id_span -- rounded up. (max_id - min_id + buffer)
    )
    SELECT *
    FROM (
             SELECT p.min_id + trunc(random() * p.id_span)::integer AS id
             FROM params p
                , generate_series(1, 1100) g -- 1000 + buffer
             GROUP BY 1 -- trim duplicates
         ) r
             JOIN words USING (id)
        LIMIT 1000
);
```



