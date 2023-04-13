-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT B.business_name, B.review_count
FROM Business B, Business_location BL, Business_parking_type BPT, Parking_type PT,
    Business_hours BH, Day_of_week DW, Reviews R
WHERE B.business_id = BL.business_id AND BL.city_name = 'las vegas'
    AND B.business_id = BPT.business_id AND BPT.parking_type_id = PT.parking_type_id AND PT.parking_type_description = 'valet'
    AND B.business_id = R.business_id AND R.stars = 5
    AND B.business_id = BH.business_id AND BH.day_id = DW.day_id AND DW.day_name = 'Friday'
ORDER BY B.business_name ASC;