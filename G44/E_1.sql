SELECT DISTINCT B.business_name AS name, B.review_count
FROM Business B, Business_location BL, Business_parking_type BPT, Parking_type PT, 
     Day_of_week DW, Business_hours BH
WHERE B.business_id = BL.business_id AND BL.city_name like '%las vegas%'
      AND B.business_id = BPT.business_id AND BPT.parking_type_id = PT.parking_type_id AND PT.parking_type_description = 'valet'
      AND B.business_id = BH.business_id AND BH.day_id = DW.day_id AND DW.day_name = 'Friday'
      AND B.stars = 5 
ORDER BY B.business_name ASC