SELECT DISTINCT BL.city_name
FROM Business_location BL
WHERE BL.business_id IN (
    SELECT BH.business_id
    FROM Business_hours BH
    GROUP BY BH.business_id
    HAVING COUNT(DISTINCT BH.day_id) < 5
)
ORDER BY BL.city_name ASC;