SELECT DISTINCT U.user_id, U.user_name, U.yelping_since
FROM User_yelp U
WHERE TO_CHAR(U.yelping_since, 'YYYY') <= '2006' AND LENGTH(U.user_name) = 1
ORDER BY U.user_name ASC
FETCH FIRST 50 ROWS ONLY;