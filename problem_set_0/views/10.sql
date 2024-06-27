SELECT "english_title"
AS "Most Complex Hokusai Painting"
FROM "views"
WHERE "artist" = 'Hokusai'
ORDER BY "entropy" DESC
LIMIT 1;
