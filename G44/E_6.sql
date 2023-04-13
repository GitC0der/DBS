-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT MAX(nb) AS count
FROM (
    SELECT R.user_id, COUNT(DISTINCT R.business_id) AS nb
    FROM Reviews R
    GROUP BY R.user_id
)