SELECT DISTINCT B.business_id, B.business_name, B.review_count
FROM Business B
WHERE B.review_count > 3000 AND B.business_id IN (
    SELECT BDR.business_id
    FROM Business_dietary_restrictions BDR
    GROUP BY BDR.business_id
    HAVING COUNT(DISTINCT BDR.dietary_rest_id) > 2
)
ORDER BY B.review_count DESC;