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

# Best first word by word matches
sql: https://github.com/AutoIDM/wordle/blob/main/best_first_word_by_word_matches.sql



**Results**
| matcher_strategy   | word | words matched | total_word_count |
| -------------------- | ----- | ----- | ----- |
| oneletter\_matcher   | toeas | 12417 | 12972 |
| oneletter\_matcher   | stoae | 12417 | 12972 |
| oneletter\_matcher   | aloes | 12412 | 12972 |
| oneletter\_matcher   | aeons | 12407 | 12972 |
| oneletter\_matcher   | soare | 12395 | 12972 |
| twoletter\_matcher   | rales | 5995  | 12972 |
| twoletter\_matcher   | laers | 5995  | 12972 |
| twoletter\_matcher   | lears | 5995  | 12972 |
| twoletter\_matcher   | earls | 5995  | 12972 |
| twoletter\_matcher   | laser | 5995  | 12972 |
| threeletter\_matcher | stear | 1724  | 12972 |
| threeletter\_matcher | resat | 1724  | 12972 |
| threeletter\_matcher | aster | 1724  | 12972 |
| threeletter\_matcher | rates | 1724  | 12972 |
| threeletter\_matcher | reast | 1724  | 12972 |
| fourletter\_matcher  | stear | 541   | 12972 |
| fourletter\_matcher  | resat | 541   | 12972 |
| fourletter\_matcher  | rates | 541   | 12972 |
| fourletter\_matcher  | aster | 541   | 12972 |
| fourletter\_matcher  | reast | 541   | 12972 |
| fiveletter\_matcher  | stear | 111   | 12972 |
| fiveletter\_matcher  | resat | 111   | 12972 |
| fiveletter\_matcher  | aster | 111   | 12972 |
| fiveletter\_matcher  | rates | 111   | 12972 |
| fiveletter\_matcher  | reast | 111   | 12972 |


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

