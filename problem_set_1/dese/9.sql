SELECT "name"
FROM "districts"
LEFT JOIN "expenditures"
    ON "expenditures"."district_id" = "districts"."id"
WHERE (
          ("pupils" IS NOT NULL)
              AND
          ("pupils" = (SELECT MIN("pupils")
                       FROM "expenditures"
                       WHERE "pupils" IS NOT NULL)
          )
      )
ORDER BY "pupils";