SELECT "name", "pupils"
FROM "districts"
LEFT JOIN "expenditures"
    ON "expenditures"."district_id" = "districts"."id"
WHERE "pupils" IS NOT NULL;