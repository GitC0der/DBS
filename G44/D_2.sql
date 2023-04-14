SELECT BL.state_name, COUNT(*) AS num_businesses
FROM Business_location BL
GROUP BY BL.state_name
ORDER BY num_businesses DESC
FETCH FIRST 10 ROWS ONLY;