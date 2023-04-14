SELECT MAX(nb) AS count
FROM (
    SELECT COUNT(BHC.category_id) AS nb
    FROM Business_has_categories BHC
    GROUP BY BHC.business_id
)