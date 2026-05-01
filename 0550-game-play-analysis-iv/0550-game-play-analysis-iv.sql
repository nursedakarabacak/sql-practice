/* Write your T-SQL query statement below */
/* herbir oyuncunun ilk giriş tarihini bulamalıyım*/
/*ertesi gün giriş var mı bakmamalıyım */


 select ROUND(
        COUNT(DISTINCT a.player_id)*1.0 / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
from Activity a
join
(select player_id,min(event_date) as first_login
from Activity a
group by player_id ) b 
ON a.player_id = b.player_id
AND a.event_date = DATEADD(day, 1, b.first_login);