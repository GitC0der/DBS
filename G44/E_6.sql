SELECT MAX(nb) AS count
FROM (
    SELECT COUNT(DISTINCT R.business_id) AS nb
    FROM Reviews R
    GROUP BY user_id
);