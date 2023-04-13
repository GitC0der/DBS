-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT B.business_name, R.stars
FROM Business B, Reviews R, Business_location BL
WHERE B.business_id = BL.business_id and BL.state_name = 'CA'
    and B.business_id = R.business_id
ORDER BY R.stars DESC, B.business_name ASC
LIMIT 10;