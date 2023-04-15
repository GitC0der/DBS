SELECT *
FROM (SELECT DISTINCT B.business_name, B.stars
      FROM Business B, Business_location BL
      WHERE B.business_id = BL.business_id AND BL.state_name = 'CA'
      ORDER BY B.stars DESC, B.business_name ASC)
WHERE ROWNUM <= 10