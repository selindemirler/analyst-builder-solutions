WITH ydate AS(
  SELECT date  as yesterday, temperature from temperatures
)

select t.date AS formatted_date from temperatures t INNER JOIN ydate y ON t.date - y.yesterday = INTERVAL '1 day'
AND  t.temperature > y.temperature 
ORDER BY t.date ASC