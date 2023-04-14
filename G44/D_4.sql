SELECT DISTINCT BL.city_name
FROM Business_location BL, Reviews R
WHERE BL.business_id = R.business_id
GROUP BY BL.city_name, R.business_id
HAVING COUNT(DISTINCT R.review_id) >= 2
ORDER BY BL.city_name ASC
FETCH FIRST 50 ROWS ONLY;