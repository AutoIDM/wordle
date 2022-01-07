with letters as (

SELECT
	SUBSTRING(word, 1, 1) letter
from public.wordle

union all 

SELECT
	SUBSTRING(word, 2, 1) letter
from public.wordle

union all 

SELECT
	SUBSTRING(word, 3, 1) letter
from public.wordle

union all 

SELECT
	SUBSTRING(word, 4, 1) letter
from public.wordle

union all 

SELECT
	SUBSTRING(word, 5, 1) letter
from public.wordle

)

select letter, count(*) from letters
group by letter
order by count(*) desc
