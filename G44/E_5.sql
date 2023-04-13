-- Warning: the following query has not been used on the DBMs, nor has it been verified in any other way!

SELECT U.user_id, U.user_name, U.yelping_since
FROM User U
WHERE U.yelping_since <= '2006-12-31' AND LEN(U.user_name) = 1
ORDER BY U.user_name ASC
LIMIT 50;