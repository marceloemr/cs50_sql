SELECT city, COUNT("id") as "Number of Schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Number of Schools" DESC, "city" ASC
LIMIT 10;