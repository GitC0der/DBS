-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT MAX(nb)
FROM (
    SELECT COUNT(BHC.category_id) AS nb
    FROM Business_has_categories BHC
    GROUP BY BHC.business_id
)