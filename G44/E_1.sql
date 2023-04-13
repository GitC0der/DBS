-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT B.name, B.review_count
FROM Business B, Business_location BL, Business_parking_type BPT, Parking_type PT,
    Business_hours BH, Day_of_week DW, Reviews R
WHERE B.business_id = BL.business_id and BL.city_name = 'las vegas'
    and B.business_id = BPT.business_id and BPT.parking_type_id = PT.parking_type_id and PT.parking_type_description = 'valet'
    and B.business_id = R.business_id and R.stars = 5
    and B.business_id = BH.business_id and BH.day_id = DW.day_id and DW.day_name = 'Friday'
ORDER BY B.name ASC;