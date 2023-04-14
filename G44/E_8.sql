SELECT 
  MIN(nb) as min_categories, 
  MAX(nb) as max_categories, 
  AVG(nb) as mean_categories, 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY nb) AS median_categories
FROM
  (SELECT COUNT(DISTINCT BC.category_name) AS nb 
   FROM Business_has_categories BHC, Business_categories BC
   WHERE BHC.category_id = BC.category_id
   GROUP BY BHC.business_id);