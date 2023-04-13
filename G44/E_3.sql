-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!
SELECT R.business_id
FROM Reviews R
GROUP BY R.business_id
HAVING COUNT(DISTINCT R.user_id) > 1030
ORDER BY R.business_id ASC