SELECT AVG(B1.stars) - AVG(B2.stars) AS DIFFERENCE_OF_AVERAGES
FROM Business B1, Business B2, Business_ambiance BA1, Business_ambiance BA2, Ambiance A1,
    Ambiance A2, Business_good_for_meal BGM1, Business_good_for_meal BGM2, Good_for_meal GFM
WHERE B1.business_id = BA1.business_id AND BA1.ambiance_id = A1.ambiance_id AND A1.ambiance_description = 'divey'
    AND B1.business_id = BGM1.business_id AND BGM1.good_for_meal_id = GFM.good_for_meal_id AND GFM.good_for_meal_description = 'dinner'
    AND B2.business_id = BA2.business_id AND BA2.ambiance_id = A2.ambiance_id AND A2.ambiance_description = 'upscale'
    AND B2.business_id = BGM2.business_id AND BGM2.good_for_meal_id = GFM.good_for_meal_id AND GFM.good_for_meal_description = 'dinner'
GROUP BY GFM.good_for_meal_id