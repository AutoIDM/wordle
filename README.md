# Wordle Analytics 
Wordle is a fun game, but I couldn't resist knowing what a great first / second word choice would be.

# Results

Most used letters

| Letter | Count |
| --- | --- |
| s      |	6665 |
| e|	6662|
| a|	5990|
| o|	4438|
| r|	4158|
| i|	3759|
| l|	3371|
| t|	3295|
| n|	2952|
| u|	2511|

# Best first word

-- Best first word to use

```sql
select * from public.wordle
where 
word like ('%s%')
and
word like ('%e%')
and
word like ('%a%')
and
word like ('%o%')
and
word like ('%r%')
```

**Results**
1. arose
1. aeros
1. soare

# Best second word

```sql
--If no matches on the first word, best second word
select * from public.wordle
where 
word like ('%i%')
and
word like ('%l%')
and
word like ('%t%')
and
word like ('%n%')
and
word like ('%u%')
```
**Results**
1. unlit
1. until


# Run analytics yourself
1. Setup postgres ( `podman run -e POSTGRES_PASSWORD=postgres -p 5432:5432 -h postgres -d postgres` )
2. Run [Initial Setup](https://github.com/AutoIDM/wordle/blob/main/initial_setup.sql)
3. Run [Most Used Letter](https://github.com/AutoIDM/wordle/blob/main/most_used_letter.sql)
4. Have fun!

