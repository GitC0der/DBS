SELECT COUNT(R.review_id) AS review_count, BL.city_name
FROM Business_location BL, Reviews R
WHERE R.business_id = BL.business_id AND R.user_id IN (
    SELECT F.user_id
    FROM Friends F
    GROUP BY F.user_id
    HAVING COUNT(DISTINCT friends_id) < 3
)
GROUP BY BL.city_name
ORDER BY review_count ASC, BL.city_name ASC
FETCH FIRST 1 ROW ONLY