SELECT business_name, stars
FROM (
    SELECT DISTINCT B.business_name, R.stars
    FROM Business B, Reviews R, Business_location BL
    WHERE B.business_id = BL.business_id AND BL.state_name = 'CA'
        AND B.business_id = R.business_id
    ORDER BY R.stars DESC, B.business_name ASC
)
WHERE ROWNUM <= 10
ORDER BY stars DESC, business_name ASC;