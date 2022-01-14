WITH oneletter as (

SELECT 
CONCAT('[',word,']') as regex, 
WORD as ogword

FROM public.wordle

), twoletter as (

SELECT 
CONCAT('[',word,']','[',word,']') as regex, 
WORD as ogword

FROM public.wordle

), threeletter as (

SELECT 
CONCAT('[',word,']','[',word,']','[',word,']') as regex, 
WORD as ogword

FROM public.wordle

), fourletter as (

SELECT 
CONCAT('[',word,']','[',word,']','[',word,']','[',word,']') as regex, 
WORD as ogword

FROM public.wordle

), fiveletter as (

SELECT 
CONCAT('[',word,']','[',word,']','[',word,']','[',word,']','[',word,']') as regex, 
WORD as ogword

FROM public.wordle

), oneletter_crossjoin as (

select
*
from oneletter
cross join public.wordle wordle
where wordle.word ~* oneletter.regex

), twoletter_crossjoin as (

select
*
from twoletter
cross join public.wordle wordle
where wordle.word ~* twoletter.regex

), threeletter_crossjoin as (

select
*
from threeletter
cross join public.wordle wordle
where wordle.word ~* threeletter.regex

), fourletter_crossjoin as (

select
*
from fourletter
cross join public.wordle wordle
where wordle.word ~* fourletter.regex


), fiveletter_crossjoin as (

select
*
from fiveletter
cross join public.wordle wordle
where wordle.word ~* fiveletter.regex

), oneletter_matcher as (

SELECT 
'oneletter_matcher',
ogword, 
COUNT(*) word_matches,
(select count(*) from public.wordle) as total_words


FROM oneletter_crossjoin
GROUP BY OGWORD
ORDER BY count(*) desc
limit 5

), twoletter_matcher as (
SELECT 
'twoletter_matcher',
ogword, 
COUNT(*) word_matches,
(select count(*) from public.wordle) as total_words


FROM twoletter_crossjoin
GROUP BY OGWORD
ORDER BY count(*) desc
limit 5

), threeletter_matcher as (
SELECT 
'threeletter_matcher',
ogword, 
COUNT(*) word_matches,
(select count(*) from public.wordle) as total_words


FROM threeletter_crossjoin
GROUP BY OGWORD
ORDER BY count(*) desc
limit 5

), fourletter_matcher as (
SELECT 
'fourletter_matcher',
ogword, 
COUNT(*) word_matches,
(select count(*) from public.wordle) as total_words


FROM fourletter_crossjoin
GROUP BY OGWORD
ORDER BY count(*) desc
limit 5

), fiveletter_matcher as (
SELECT 
'fiveletter_matcher',
ogword, 
COUNT(*) word_matches,
(select count(*) from public.wordle) as total_words


FROM fiveletter_crossjoin
GROUP BY OGWORD
ORDER BY count(*) desc
limit 5

), final as (

select 
*
from oneletter_matcher

union all 

select 
*
from twoletter_matcher

union all 

select 
*
from threeletter_matcher

union all 

select 
*
from fourletter_matcher

union all 

select 
*
from fiveletter_matcher

)
select * from final
