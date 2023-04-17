SELECT DISTINCT C.city_name
FROM Cities C
WHERE C.city_name IN ( -- some Cities do not have businesses
    SELECT DISTINCT BL.city_name
    FROM Business_location BL
) AND NOT EXISTS (
    SELECT *
    FROM Business_location BL2, Business B
    WHERE C.city_name = BL2.city_name AND BL2.business_id = B.business_id AND B.review_count < 2
)
ORDER BY C.city_name
FETCH FIRST 50 ROWS ONLY