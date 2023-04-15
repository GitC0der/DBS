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

/*

Find all cities that satisfy the following: each business in the city has at least two reviews.

SELECT DISTINCT BL.city_name
FROM Business_location BL, Reviews R
WHERE BL.business_id = R.business_id
GROUP BY BL.city_name, R.business_id
HAVING COUNT(DISTINCT R.review_id) >= 2
ORDER BY BL.city_name ASC
FETCH FIRST 50 ROWS ONLY;

This translates to: find the city names of businesses that have at least two reviews
*/