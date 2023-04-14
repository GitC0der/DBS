SELECT BL.state_name, COUNT(DISTINCT B.business_id) AS business_count
FROM Business B, Business_location BL, Business_dietary_restrictions BDR,
    Dietary_restrictions DR
WHERE B.business_id = BL.business_id AND B.business_id = BDR.business_id
    AND BDR.dietary_rest_id = DR.dietary_rest_id AND DR.dietary_rest_description = 'vegetarian'
GROUP BY BL.state_name
ORDER BY business_count DESC