SELECT SUM(U.review_count) as review_count, BL.city_name as city_name
FROM Business_location BL, Business B, Reviews R, User_yelp U
WHERE BL.business_id = B.business_id AND B.business_id = R.business_id AND R.user_id = U.user_id
    AND U.user_id NOT IN (
        SELECT F.user_id
        FROM Friends F
        WHERE F.user_id = U.user_id
        GROUP BY F.user_id
        HAVING COUNT(*) >= 3
    )
GROUP BY BL.city_name
ORDER BY review_count ASC, city_name ASC
FETCH FIRST 1 ROW ONLY;