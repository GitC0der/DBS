WITH Top_business AS (
    SELECT B.business_id
    FROM Business B
    ORDER BY B.review_count DESC
    FETCH FIRST 10 ROWS ONLY
),
Review_counts AS (
    SELECT COUNT(*) AS review_count, R.user_id
    FROM Reviews R
    GROUP BY R.user_id
)

SELECT business_id, reviewer_rank, review_count
FROM (
    SELECT R.business_id, RC.review_count, ROW_NUMBER()
      OVER (PARTITION BY TB.business_id
            ORDER BY RC.review_count DESC) AS reviewer_rank
    FROM Top_business TB, Reviews R, Review_counts RC
    WHERE R.business_id = TB.business_id AND R.user_id = RC.user_id
)
WHERE reviewer_rank <= 3
ORDER BY business_id ASC, reviewer_rank ASC