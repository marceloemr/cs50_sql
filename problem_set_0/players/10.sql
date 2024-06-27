SELECT
    "first_name" as "Heaviest Non-American Player Last Name",
    "last_name" AS "Heaviest Non-American Player Last Name"
FROM "players"
WHERE "birth_country" != 'USA'
ORDER BY "weight" DESC
LIMIT 1;
