SELECT AVG(B.stars) AS stars, SUM(B.review_count) AS review_count
FROM Business B
WHERE B.business_id IN (
    SELECT BHC1.business_id
    FROM Business_has_categories BHC1
    GROUP BY BHC1.business_id
    HAVING COUNT(DISTINCT BHC1.category_id) >= 2
) AND B.business_id IN (
    SELECT BPT1.business_id
    FROM Business_parking_type BPT1
    GROUP BY BPT1.business_id
    HAVING COUNT(DISTINCT BPT1.parking_type_id) > 1
);