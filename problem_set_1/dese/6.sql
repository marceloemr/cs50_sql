SELECT "name"
FROM "schools"
LEFT JOIN "graduation_rates"
    ON "graduation_rates"."school_id" = "schools"."id"
WHERE "graduated" = 100;