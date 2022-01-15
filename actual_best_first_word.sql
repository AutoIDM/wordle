WITH guesses as (

SELECT 
word,
SUBSTRING(word, 1, 1) letter_one,
SUBSTRING(word, 2, 1) letter_two,
SUBSTRING(word, 3, 1) letter_three,
SUBSTRING(word, 4, 1) letter_four,
SUBSTRING(word, 5, 1) letter_five

FROM public.wordle

), answers as (

select
word,
SUBSTRING(word, 1, 1) letter_one,
SUBSTRING(word, 2, 1) letter_two,
SUBSTRING(word, 3, 1) letter_three,
SUBSTRING(word, 4, 1) letter_four,
SUBSTRING(word, 5, 1) letter_five

from answer

), crossjoin as (

select
guesses.word as guess,
answers.word as answer,
CASE 
      WHEN answers.letter_one in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a1_match,
CASE 
      WHEN answers.letter_two in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a2_match,
CASE 
      WHEN answers.letter_three in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a3_match,
CASE 
      WHEN answers.letter_four in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a4_match,
CASE 
      WHEN answers.letter_five in (guesses.letter_one, guesses.letter_two, guesses.letter_three, guesses.letter_four, guesses.letter_five)   THEN 1
      ELSE 0
end as a5_match
from guesses
cross join answers

), count_answers as (

select 
guess,
answer,
a1_match + a2_match + a3_match + a4_match + a5_match as total
from crossjoin

), maths_agg as (

select
guess,
sum(total),
avg(total) avg,
stddev(total),
max(total),
min(total)
from count_answers
group by guess
order by avg desc

), final as (

select * from maths_agg
)

select * from final


