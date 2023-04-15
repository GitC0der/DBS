SELECT COUNT(DISTINCT B.business_id) AS count
FROM Business B
WHERE NOT EXISTS (
    SELECT *
    FROM Tips T
    WHERE B.business_id = T.business_id AND T.tip_text LIKE '%awesome%' AND NOT EXISTS (
        SELECT *
        FROM Tips T2
        WHERE T2.business_id = T.business_id AND T2.user_id = T.user_id 
              AND T2.tip_date = T.tip_date - 1 AND T2.tip_text LIKE '%awesome%'
    )
)