# Wordle Analytics 
Wordle is a fun game, but I just couldn't resist knowing what a great first / second word choice would be. 

There's multiple strategies available here in this repo, the best strategy we have so far is listed at the top. Feel free to add ideas as an issue! Orginally I went with something really naive as I didn't want to think too hard, but then I opened pandoras box, and here we are!

One core tennat here is that we don't cheat while we're playing the game, we just want to know what an optimal strategy is going into the game.

# Wordle design choices
Wordle has every possible 5 letter word listed as an avilable option, and there's another list of possible answers due to the fact that a lot of the 5 letter words are very rarely used in english. Due to that our best strategy takes the possible answers into account while determining what the best first word to use is! Note that not every strategy on this list has this feature due to not knowing about all of this before hand! https://notfunatparties.substack.com/p/wordle-solver was a good resource that explained the answers vs question list. 

# Best first word

Test every combination of Question (~12k words) to Answer (~2k words from Wordle's list). Pick the word with the most number of letter matches.

Some improvements available like right now we double count letters if the answer word has the letter duplicated.

## SQL
https://github.com/AutoIDM/wordle/blob/main/actual_best_first_word.sql 

## Results
|guess|sum |avg               |stddev                |max|min|
|-----|----|------------------|----------------------|---|---|
|roate|4594|1.9844492440604752|1.0355479830658308    |5  |0  |
|oater|4594|1.9844492440604752|1.0355479830658308    |5  |0  |
|orate|4594|1.9844492440604752|1.0355479830658308    |5  |0  |
|realo|4584|1.9801295896328294|1.0105506429868332    |5  |0  |
|alert|4559|1.9693304535637149|1.0694998512424874    |5  |0  |
|alter|4559|1.9693304535637149|1.0694998512424874    |5  |0  |
|taler|4559|1.9693304535637149|1.0694998512424874    |5  |0  |
|later|4559|1.9693304535637149|1.0694998512424874    |5  |0  |
|artel|4559|1.9693304535637149|1.0694998512424874    |5  |0  |
|ratel|4559|1.9693304535637149|1.0694998512424874    |5  |0  |
|arose|4534|1.9585313174946004|1.0107501271667612    |5  |0  |
|soare|4534|1.9585313174946004|1.0107501271667612    |5  |0  |
|aeros|4534|1.9585313174946004|1.0107501271667612    |5  |0  |
|retia|4511|1.9485961123110151|1.0308304749950321    |5  |0  |


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

# First word by letter matching
Just looking at the number of letters that match the answer word, what's the best word for generating one letter match? What's the best for generating 2 letter matches?

## SQL 
https://github.com/AutoIDM/wordle/blob/main/best_first_word_by_word_matches.sql

## Results

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


# Naive approach looking at frequency of letters used
Looking at all of the 5 letter words available what's the most commonly used letter?

## Most common letter
SQL: https://github.com/AutoIDM/wordle/blob/main/most_used_letter.sql

## First Word
Take the top 5 letters from the most common letter and find a word

## SQL
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
## Results
1. arose
1. aeros
1. soare

# Best second word
If no matches on the first word, best second word based on the next 5 most commonly used letters

## SQL
```sql
--
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

