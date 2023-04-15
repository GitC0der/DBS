SELECT DISTINCT C.city_name 
FROM Cities C
WHERE C.city_name IN ( -- some Cities do not have businesses
    SELECT DISTINCT BL.city_name
    FROM Business_location BL
) AND NOT EXISTS (
    SELECT BH.business_id
    FROM Business_location BL2, Business_hours BH
    WHERE C.city_name = BL2.city_name AND BL2.business_id = BH.business_id
    GROUP BY BH.business_id
    HAVING COUNT(DISTINCT BH.day_id) >= 5
)
ORDER BY C.city_name ASC

/*

Find the cities where all businesses work less than 5 days a week.

SELECT DISTINCT BL.city_name
FROM Business_location BL
WHERE BL.business_id IN (
    SELECT BH.business_id
    FROM Business_hours BH
    GROUP BY BH.business_id
    HAVING COUNT(DISTINCT BH.day_id) < 5
)
ORDER BY BL.city_name ASC;

This translates to: find the city names of businesses that works less than 5 days a week.
*/