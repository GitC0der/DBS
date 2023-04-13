-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT B.business_id, B.business_name, B.review_count
FROM Business B
WHERE B.review_count > 3000 AND B.business_id in (
    SELECT BDR.business_id
    FROM Business_dietary_restrictions BDR
    GROUP BY BDR.business_id
    HAVING COUNT(DISTINCT BDR.dietary_rest_id)
)
ORDER BY B.review_count DESC;