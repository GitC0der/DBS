WITH Top_business AS ( -- find the top 100 reviewed businesses for each city
    SELECT city_name, business_id AS top_business_id
    FROM (
        SELECT BL.city_name, BL.business_id, Rank() 
          OVER (PARTITION BY BL.city_name
                ORDER BY B.review_count DESC) AS rank
        FROM Business B, Business_location BL
        WHERE B.business_id = BL.business_id
    )
    WHERE rank <= 10
    ORDER BY city_name ASC
),
Top_business_counts AS ( -- find the sum of review counts for the top 100 reviewed businesses for each city
    SELECT SUM(B.review_count) AS top_count, BL.city_name
    FROM Top_business TB, Business B, Business_location BL
    WHERE TB.top_business_id = B.business_id AND TB.top_business_id = BL.business_id AND TB.city_name = BL.city_name
    GROUP BY BL.city_name
),
Total_counts AS ( -- find the sum of review counts for all businesses for each city
    SELECT SUM(B.review_count) AS total_count, BL.city_name
    FROM Business B, Business_location BL
    WHERE B.business_id = BL.business_id
    GROUP BY BL.city_name
)

SELECT TC.city_name AS city
FROM Top_business_counts TBC, Total_counts TC
WHERE TC.city_name = TBC.city_name AND TBC.top_count >= 2 * (TC.total_count - TBC.top_count)

-- note that this returns all cities that have less than 100 businesses!