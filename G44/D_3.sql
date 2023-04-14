SELECT B.business_name, B.stars, B.review_count
FROM Business B, Business_has_categories BHC, Business_categories BC,
    Business_music BM, Music M
WHERE B.business_id = BHC.business_id AND BHC.category_id = BC.category_id
    AND BC.category_name = 'Irish Pub'
    AND B.business_id = BM.business_id AND BM.music_id = M.music_id
    AND M.music_description = 'live'
ORDER BY B.business_name ASC;