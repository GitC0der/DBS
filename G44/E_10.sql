-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT COUNT(DISTINCT BHC.business_id) AS count
FROM Business_has_categories BHC, Business_categories BC, Business_hours BH,
    Day_of_week DW
WHERE BHC.category_id = BC.category_id AND BC.category_name = 'Dry Cleaning'
    AND BHC.business_id = BH.business_id AND
    ((BH.day_id = DW.day_id AND DW.day_name = 'Saturday'
        AND BH.from IS NOT NULL AND BH.to IS NOT NULL)
    OR (BH.day_id = DW.day_id AND DW.day_name = 'Sunday'
        AND BH.from IS NOT NULL AND BH.to IS NOT NULL))