select 
    contest_id,
    round(count(r.user_id) / (select count(*) from Users) * 100, 2) as percentage
from Register r
join Users u on u.user_id = r.user_id
group by contest_id
order by percentage desc, contest_id asc;